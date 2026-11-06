Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953652;
	b=R3onNsRyJK3pHolQDRbY2JNQIc9B+k9jRQaBv2YsIWwJRL8xi3CT7sBWzwbueNkLtu46
	 QnpTuQcwzUrequEvE/1MtuLn727pRVfWGizk79W5u7Q/z9MOt9IEij+eRipfcbapIcNbz
	 Fg4bZcLxEACn9hYIjZthKXqgKJaMLY0VLnMX5p1Ymtkw6c2zA5fM4D1FduM20+K/vXG25
	 hReSzDB62UEMa5XJV8flPxpgV01bbZgP0QNRBHass3kF6Tm1HkrewBw7YJkrKxrfJ7+6j
	 LJLR/yOKv+iGk4hnkmyZZJq/Uh/bNc2Yg3sNq8TBcgefV7OfLuiGRTGPY4KTboZIkPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V2wYRQpevpCb45SBy3n0W/fgsH08qxa9cpiriaBTcOI=;
	b=ivkPd8G6zrTbHZdUjQ0xZtK2C3uS7a5vQsD9Ak9YX4zfP0weQcDZ40PH79jAAw+GEd9K
	 Jz34MQ2fM0fl8vc4YBiCh1dCklqM+HQno/cv21wugo7xEtioOqBcJtKcs2ncS1CRUlwj1
	 PSTgcB5iQ+/04ybQr/uhuwLO6JKRkFqMy17M7/nGtpgIddJ+MTfpwuTDXIFDySNeukES4
	 p6cLPmCpX+kxonR/gQ7oO2EutIqAXr9EMmKIuKdV3oRsjhvOKHw8nFJF+Y5z+bpB0BreR
	 g6V0oJYWNLl7cxRFrGx8Dk6pN5jcbweGf+CAIuBcmrTvX3s8PGW4jaQ3W9cpEgTdocg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Husz4Ph2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8rLLhxZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC93606A333
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC93606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Husz4Ph2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8rLLhxZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RAQV3243938
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V2wYRQpevpC
	b45SBy3n0W/fgsH08qxa9cpiriaBTcOI=; b=Husz4Ph25FxvMw0OcQN+Bo5d0ho
	eL9lvD29FR5ZRPzyWGSLodCVGDtBzNjTatbO+Q6ac8XZZPmoBVbWF42KrWz8k/9H
	KahRA/gOJNG8rpNvRdNRFHhyXvjWE6gzSDA6FBRXmU/Kf5rrqdCR+4VLppJVtinm
	dADOptrucQHoBxJ9YSjkuI/TTgsBfNCHMY/VVnPg2W/c5RKbccUxVIviszFiMr0t
	25/u4dtpcIKSyGNbEITEgzA0Z3TIQLAyBdnilweP97gCG/gkiadwrL8oYwnW5IYp
	ZjIV4jLpHRqM33oahqpZmFrgM87G/iE2h0H8m/Y2irnwVtv5UsDOrNiKEQw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1tys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:27:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso632025a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953650; x=1794558450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2wYRQpevpCb45SBy3n0W/fgsH08qxa9cpiriaBTcOI=;
        b=c8rLLhxZLEv/uX+vz0ovzWDe61AOGwHyBYUl+DIGSymgnxUy/od/+PXPt3zLgaR5K9
         iMSga0CwZQxg1wbybRpiWblAuTOQx4LaXxqjL9+dVaNrnpOZIfzS1FIpgfmQGFGZSzR3
         RiSgqtWwHAlNaaKtG6f6Y+Vd5Oshiua0546oR+S9XAYILH/+F8qRFVikEKP12fFa3cKX
         F+1h7bY74J9vZYgpUTnjWzaSiENLsRX43uFqz2H3SPj0a4ypuOZiAK3VYDXDA15hL+0j
         Rw07oQxDk/EfB5bhoyZCgfyBzZBg3zZkxorU2FGHdd3xdaPczwE7VPndumuIXhzhbHjX
         1kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953650; x=1794558450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2wYRQpevpCb45SBy3n0W/fgsH08qxa9cpiriaBTcOI=;
        b=d9Yc6Xbxlh4U2pVzjPRI3CgMh1EDPWhu6V2SjaaeG91mgv+q8psCCsDlfL/U0JLvSP
         IrP7KybTEtiIKiLp5u+tZi7v7lIqZl+l1Ux3CYgmOuXrKnzuaq5njoefh5/iVfUidkOz
         Bx9i0pD2e9PIxfsEUSeXzyHoeXzCRmDf+KFBlcNf6OwM0pIIsTiS7YAkar7z3A3ucKHU
         paREK2277e/l7bqANntnZbMUXy6ex1RiQcGl2mHNYYPO5SKHU2kp7psuP5b9NsvT0fWX
         Fr90+wariCoIx/T1i5JKeSJAXoWvYSAn4+12GS5i/2WUqz/RhwZGsdXAyEeijfF1dd0k
         ORVg==
X-Forwarded-Encrypted: i=1; AL+hErGvoTxf5bJOISNMUKrRQDgMgGL9YhN5m53Iuyol9v3QL01HKq+ITjf8scbvirzLjqODAQMiRnC849vvDJ2L@vger.kernel.org
X-Gm-Message-State: APuU4Z9zVtmCfCiYt7/k7ckpxL0HouxQhIH65l6ApiHi+TsIwJHwyPOy
	41pWOdvOBTJIEC6gng5KFHPHvuNKG9aTY5R64k0Ux1Da6+EPuUx7aeMlOH8AUmAOFdoqHbfe274
	LzcFfOOqEkRUKrLNoHVtBNIxkI6ek4/jxlycwglcVrSTxThwgu+p8TD0BZsuvYNq98Kr6
X-Gm-Gg: AYBFou3TvFw2nZ97t+/PczhitJRaZcagb/7iP/zUOUYjaOMaufe2FJBWGiVOdYw1DIK
	tTMPlH9jkJNa35191x5lZ5Mtfq2Jfl1KTM7iQNqNc2XqvmneSBPyzW5lx4XzY55JSiAy8eRHPW9
	JFNdN4sEzG/ED4OasGlv2pBRctQt0cI70e/vv7ZR0xBdr9DuP8I8lrz7S2dgqLqLsK3Rsls75TM
	V3AkKseVFrh37q8pDXX48bZezfdoG4JDECYwb6eH97GmmcVUNzhMi+Z06tpFaYynCV3jaxvf7DK
	PPRAZVKUiFzzBWkqDqjiPha7sgoo4Lw+2ydSamdNHJVdfFzj+8YIc4vClE8moxHUu7zhzBuzpGV
	BrVgPWGXjtXosfNfyyd34ID/N0nrKQx7FBgpWJOstMVvLWqX6vweHwUkphlbEwKBHjb0jhHTEKw
	MifQ==
X-Received: by 2002:a17:90b:2b4c:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b0db5f54cdmr2023399a91.7.1793953650345;
        Fri, 06 Nov 2026 00:27:30 -0800 (PST)
X-Received: by 2002:a17:90b:2b4c:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b0db5f54cdmr2023366a91.7.1793953649879;
        Fri, 06 Nov 2026 00:27:29 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:29 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH 1/3] phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract
Date: Fri,  6 Nov 2026 13:57:14 +0530
Message-ID: <20261106082716.128968-2-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed8f73 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LeDc4IpKX6SiiW4862oA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXzhOZR4gHCYDm
 ajsR46lsdT5IU/vUybQlJnImsE1ToWZAnoG14VU2ip+liomZ+w6DnQIQnSmrP2KIareD17i+wBU
 zRjgb+PCfyOVcQEACz0T7j85XoAMlNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX8aMyZiW+72xp
 d7tzq40+fT8dzcN89YznZuKgqRqxch26Wzb6LxQda+GwNmQqYKOjA48M4a/svq/Hd/dZC0jj5Jy
 fznJaysKFwkq6nyNF5V3Int4IQM1zl9/JiX+iSUxt8vCsmJX+xDHQCe9Ig7JoQZBD7WDI4yJa9M
 piGop8FRPG6PL4WG3nA+tSB7JvzEL9Lk2y3SR1LtHHzmkvl/zLxpYx80Q9ezrP+yP7EqXuO7BpZ
 vCYW8Ux/Xwqo3e23rq04BLfnyrMrnCvsqu+bAQy6Bd0nCwenrv//A/qBmf5P2+9CsU/CMRimiq1
 4DrqukgcbUx20gwrYfiwkugY989fuZE4UkwIkqLSJXqcXtHD0wlmUOukFk/jO4zyF0NuzjxgQj/
 mJtc+VwB5lMjEg48l1nHdaZcOO4kbi7DVaDqo8BCMPplWfmwXXe8+A7pw5fcY8bA3eK7tbwPVe/
 dWso7jhjIfwX3DHU9pA==
X-Proofpoint-GUID: J71O7oTLPk5o73IIHwkM3B2liwrB2ycj
X-Proofpoint-ORIG-GUID: J71O7oTLPk5o73IIHwkM3B2liwrB2ycj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

dwc3 core only calls phy_set_mode()/phy_set_mode_ext() with the base
PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE. It never passes the
PHY_MODE_USB_{HOST,DEVICE}_SS/HS/FS/LS submode values to any PHY
driver. However, QMP PHY drivers need to know whether a SuperSpeed
link is present to select the correct autonomous-mode wake interrupt
mask, and phy_mode alone cannot carry that.

Add enum qcom_usb_ss_state (UNKNOWN/PRESENT/ABSENT) and carry it
through the existing submode argument of phy_set_mode_ext(), instead
of extending enum phy_mode further. UNKNOWN is the default so callers
that do not yet pass a real value keep current behavior.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
 include/linux/phy/phy-qcom-qmp-usb-ss.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/linux/phy/phy-qcom-qmp-usb-ss.h

diff --git a/include/linux/phy/phy-qcom-qmp-usb-ss.h b/include/linux/phy/phy-qcom-qmp-usb-ss.h
new file mode 100644
index 000000000000..4da4d71e977d
--- /dev/null
+++ b/include/linux/phy/phy-qcom-qmp-usb-ss.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Shared submode contract between dwc3-qcom glue and the Qualcomm QMP
+ * USB3/combo PHY driver for communicating live SuperSpeed link presence
+ * at suspend-entry, via phy_set_mode_ext()'s submode argument.
+ */
+
+#ifndef _PHY_QCOM_QMP_USB_SS_H_
+#define _PHY_QCOM_QMP_USB_SS_H_
+
+enum qcom_usb_ss_state {
+	QCOM_USB_SS_UNKNOWN = 0,
+	QCOM_USB_SS_PRESENT,
+	QCOM_USB_SS_ABSENT,
+};
+
+#endif /* _PHY_QCOM_QMP_USB_SS_H_ */
-- 
2.43.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD5F41BA7F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376550; cv=none; b=ufFveyxxmu20mKnTAhVG2tzIs/7M4K+A/ozxx6ikaeWY/DGmgNT+YJaPZUT5fi+2ZYQfURCVuoxvOHysbcaUAlJjfFRZ59B1IXK8cONNxx0kO4lcU4Q02WZt+AcDnxbRvzb8B/fop4UWir6mkpc2VVahuXZBclMB0z4YZ78GHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376550; c=relaxed/simple;
	bh=KOQNNO81+830lW+Q5k5LUwxKxi+2T+vtgXBl8cZSLfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAkreJAtch8XrCFE0/Z/t0po9jav9LClPKPRcSdN2gQvqu6p6g3A+p9z40Ac/npq78wIjeuq1gGrPZzHOoiVk02874NYcm701cBsSihRdPnShW9bbqkNQ1BWEy8E6jeIXKoo/6Zwi9xadM16nj1/jz4pdrFk+d/5Kl3/ZP+HbnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxdmszqn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8xyPbrN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxdmszqn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8xyPbrN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWEXJ2090603
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 15:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwWUHl7i5SxMpjZvZ8DdyGzjAdldYolgun/dp8YjJTM=; b=jxdmszqn7wOWgM4g
	BQIxMCEhb7VA4IFBuq8zWvTYwal3EbxIy/TY5wi9PbaOaFD1LL+aH97yZQ7HvRI9
	K26RBeI/XFAlm6QmUZU0OsNQ6QV5rCutbp/nt7TkwZCpgbg9+BAcxfN8M4pSEQgx
	IwaQarj+/eWbFERrk8p7OKo1JOdPLkIGAd5uBlAXoqTjybvAXITMGVGG1AHSXLLb
	NYpTv/JCbDXfMIlGe8OL+AofhJ5H1jwNd28tyyrlGH9odQjNmWPuMTuz/F8oTrKy
	pcQ9IuPXo2pcRVkOeXjJFikBf1YOZK+XbYtt/rjtZvyzSefQ0RqUcHsUW8MXPtDk
	GujWBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh59qcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 15:42:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so28877921cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376547; x=1786981347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwWUHl7i5SxMpjZvZ8DdyGzjAdldYolgun/dp8YjJTM=;
        b=X8xyPbrNzEpOPqEQHv/Ald26jA1dHK6MJD+JQOPrmTRYfWnx9sB+PLHwZYfgYv5qs3
         dyUU+KcJliaJZvCT2K3J7biiCE/i4FvuL+ixl1CDRlH8Yswv0sF49n0p6ZNp6OshxnkD
         zPZ5OXfeFE/KZneoAC1ugthBITtcm5amRPcYYPku+j6oKKqD2Ptx37riZMu/tETuBB76
         ghcJXucwDhu+bc/9KNmBovvcviBy8jcuDeKBB6P3AzWoOSSppthFnl1hyvpMRRZP8HvT
         zqim3wuG/8WgzT3BgR8s6qcAIQYpl+CXvfckNbPTcJ8jKlsfNu/W/FakFmCDgOWCr2w8
         pR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376547; x=1786981347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwWUHl7i5SxMpjZvZ8DdyGzjAdldYolgun/dp8YjJTM=;
        b=rFeDsiO8nSyI9IxO5tJowXQZknKF+syncLnA8I6JZ/9zBKSl6VU+yWIOkWlVE4H6tl
         8dyE6gYUZupYuQ1zaO12h4d9nNWDBk8o1dTqpbYdUKxSMVk3EGsMZEpqExx5JM23jErw
         MBcO/FMcRC9YnvlHWNq6mgMhAe7yMI9H5hx9J0iiMI1EbAdTG5Y4shWggHEplkfIPf0f
         Xv9g5J5TKke2OPvGCgjOGDUfWW9mUIiGrbav5FkkRFdEwlzjUhfHrcvUswtl9Uqm4ptj
         1O/elXslNJg8O0Pg8HIlocFbLmAA+T9KytuXvs6JLjXyYrIAd7lQXiMMNm0sXHF1lqzK
         vnkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxLDM/Hwr6RBY7PBPKX0t+TKRyI6ZeVoEok2RQSXEJgCasGW+fsK8JIj8ySLTkDG3cKaIssrMoaqnU1kYY@vger.kernel.org
X-Gm-Message-State: AOJu0YyS3JUpWmGhyAbZOWMPv4KRMG77qGK2EHO++6DsahYgj5R9wkOp
	MsCKn92OpOHuYcZl1+9DkIGW1pSZzS+onYOJo11FudWYMFolgkz8t6U/KbSPVl8jD0izQzsRLUH
	tRxFojDcuZGrJlvFJJ8MR9KVyO81/1DGKyJxKWcnuq3eQtonvERJkwI1nh+E4irfBpzqI
X-Gm-Gg: AR+sD1329JiZqDHHWvqFDdfZ1rTItb1ouy9Ut/jLdENJA7osicTQKQr9O5pqun8QTyX
	XQyA7pqUpl7synfWfm3GEfztiVB68fiM/yy4n5YjQfBF7TEThjNMXIgs61flL9aFat/GclZQKlE
	KH1m4KtNiQm+jWNLHkalckOn/kuObJAEEIl+fakTJlDzq7ICCsaGTZxDs504/IgPZaPMc1TO8zP
	JhTaThue6JHtGzLZvyqlpB94eYwdlp8tKySxIIVjqDrrZRz4ZL1IRPmFSutOtF7OZRgGzyiu9Re
	hULuQPR9jFTpQlyU56fl6xBHXURrerRDHFX9h+sOZrgIclPH8VWASPrzxzUCD6WklWu91fAC07M
	gnRLW84HUCYfpZCdJwdIkkmpFQFk+FdHY29TKENR/gROxXG8rpWmkr73LI/x4d9ee7IBly87RVZ
	chhY0haLnI9P5Evw==
X-Received: by 2002:a05:622a:1e14:b0:51c:d52:6049 with SMTP id d75a77b69052e-52d20a10f1amr262583401cf.28.1786376546760;
        Mon, 10 Aug 2026 08:42:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1e14:b0:51c:d52:6049 with SMTP id d75a77b69052e-52d20a10f1amr262581891cf.28.1786376545891;
        Mon, 10 Aug 2026 08:42:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:11 +0300
Subject: [PATCH 07/10] usb: chipidea: msm: do not force the TX FIFO idle on
 HSIC instances
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-7-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KOQNNO81+830lW+Q5k5LUwxKxi+2T+vtgXBl8cZSLfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFREDbAEKMO2A2Qs9sERI3xq59bkDCER9uEc
 7ajvN/A67+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUQAKCRCLPIo+Aiko
 1cMKCACItVH4hSeLJfpkqgtM3Mn+A0oSAX0xdpecK5aC/leaBuzd+gGevn7S9wcw4VTojJH0NY9
 dlDqP/dudfyiT5l7h3bhhYGIq/UmrMHFXjWHdY2u62V1hYgendPYLbXSSpPAeOKKKE2p/amEH6M
 uVck/ccgyD2q4xOK2AXuzcyH5Zm9vobVl0taSLfCTB7wvYltD46LNhXdMLePE9DFsID4VJLdFbh
 9Wth5gRpr2OSRCyTDtM9tzLupcOH33DHNSyCImYJuWTGYg9LnDODCk1HKcyN8/XMFFdlWX5hJcL
 hugegT0rjwOPAlYMZpozWbu4BwtyYPhlag1ogWOEb1BpZdyC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79f163 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Nuiyuvcmx6Gf9mYuf-0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: EVKTTtnCtqgmlv3ggjSfNOFN-2V0eVmE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX9X7uY2l96XA2
 HX7bDTny37pHPaRNXyxj0sl8kXUUajkZfa6SEXKSeZRdVjt8AgM0+WZor9WTAIpw0gy34DGasRl
 xgRzFB+eD3+2FSigKz0JLS6C2RYmNaY=
X-Proofpoint-GUID: EVKTTtnCtqgmlv3ggjSfNOFN-2V0eVmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXykuM6WFPOg3i
 s7f725CHefBiCe/W/fQn73UNR3gPKJyutNNHxvlvcdI3RBBBRRJN+fYEmPKkyPK62MmLEh1peA9
 9tk+XVz8CKavwOophMESPXNc87caRGcnTdN9uCtGwf9ykqE5Gx8C2gdZQuIO4RHq/1yRD47Bp3K
 AUpLDK/X9/CBwp1YFTn5cf8nRF2SwjReuZo53GglYxaP28khtngZQanvRl3NlK58ogQnoa3/Si1
 eOOOG/PkwUxC6f+TOVfUS9/nMbvUwC/77ebenacq05sNt6T710pWZWt/pfYcBanZAlCUMcVy7tq
 EkMNE406aAMCKDk4ARa4ZNM1FljIgyDCgH2feA62P4tPF+Say5KamVkoK/JiQwfYnzuM92+xcWx
 BCYurRZA3q92jMJrtKVvIZp7ZRmY5TM9uIQCmo7vMBjr2gjPdDkqdSMm5ZIcOm/YJ0Qd7m1fQcn
 oOo70jr157jigL/d3MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The controller reset handler unconditionally clears
GENCONFIG[TXFIFO_IDLE_FORCE_DIS] as a workaround for an RX buffer
collision issue. The vendor HSIC host driver never applies this
workaround on the HSIC instances and leaves the bit at its power-on
default (set), so clearing it makes the HSIC instance diverge from the
known-working configuration.

Skip the workaround for HSIC instances, like the neighbouring
GENCONFIG_2 write already does.

Fixes: 47654a162081 ("usb: chipidea: msm: Restore wrapper settings after reset")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index 9a9410a814e5..69be194f8e27 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -108,8 +108,9 @@ static int ci_hdrc_msm_notify_event(struct ci_hdrc *ci, unsigned event)
 		hw_write_id_reg(ci, HS_PHY_AHB_MODE, 0xffffffff, 0x8);
 
 		/* workaround for rx buffer collision issue */
-		hw_write_id_reg(ci, HS_PHY_GENCONFIG,
-				HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);
+		if (!msm_ci->hsic)
+			hw_write_id_reg(ci, HS_PHY_GENCONFIG,
+					HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);
 
 		if (!msm_ci->hsic)
 			hw_write_id_reg(ci, HS_PHY_GENCONFIG_2,

-- 
2.47.3


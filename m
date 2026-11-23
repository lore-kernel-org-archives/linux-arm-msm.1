Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430904;
	b=pkm2+cmrOL/T1fkpaLvjqk0YXGKvwptx0HQqrC/fMLrVbxZd6B8hn5b1+RzFwcx0XWCF
	 Wakdc5eQpusZjdMKXPBnhI0Bhqx5N+qd53vZ1ZGWYPPxq+dAysgn4XH4fUOt0XlGaSK15
	 1AM2WA8syx6cGPTpWapEvKBHI553ReAQs+g78Ze5eD1N8//lTr034qJquUB3+mg2tgvRs
	 AsezFDWVlt2iSjelzail7Hqq2+Bz1ZgYzw1kW84bM/0v8R+yXONvCZmRS7QRsDLCzE9c1
	 L+BCoGaRU2iFwB1SVXkSzZ818a2vcOAXcxu83G3+BcJdg8OHeS6bMWii05Gb/6PtSFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
	b=o2/8oxILRx0MdfWzx/ZagUqm8hvC9q5k88vhahwBYx1g920u5jFK5F2h1Xf66W0MNpW+
	 J0jqX3TzNIE7z0kgkJpLBKGHpYm47fzhSUIi1L/Jb39R2RDVIdS0WvdCo6dXB9tabfCJJ
	 9RaLzpu89IuojpJvBl8Hwy7oA9Y6+CEBzzlu7Ie2bjfViz/zB4qwpEZLo8uU6Q+5iQo0T
	 mXASgXcB7SXc3TeAsPul8l6+7FO0mLm/UWdQF4JgqNDOPvMpTI4L7p3mz6WvKVRMi0hz/
	 aA/SKUOhcRi1IToKC4phsO8JUMK4WUEWZ31Ub58iSMGM594cJ3Hqe95kJBMYAbcadzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ff2TL9+f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ix+o1GXp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC4606A682
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62BC4606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ff2TL9+f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ix+o1GXp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G7k94095732
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A4ZZmj98b3J
	yuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=; b=Ff2TL9+fT1OKjC5ByaS5VBM+lk4
	JW1cagTu6jxe/QdjF6RMcrSjg2LdOXRZtUZaP96WaW3gL/zZ5c1o1sypCjrJhmSP
	UA+P7lnIA/lj77KrD/5pg7hU7Vg4CqMIQMixCdPhIW5krXwL8otD4uZ8GtUOGUXO
	pPL461NhttzWo8o2w5qjo4aQO1nxh1/Pq1H0XqGeumv7U8Gv0edyA2qZWzNaihjd
	RaZQz6MjZSrJ5mckhGRfCoiWIMUn2+uUUIGu5P8oxTcI1OwZgoRvR7GUw0HgwOMp
	UgsKvPnPw5cMOw/otubASA3TYkvm9/Fo8ClNA47/DkZVxUFMEgiRYDvWbZg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7410ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a073778890so2533516b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430902; x=1796035702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
        b=ix+o1GXpdBNeZ2vgOzSP5/Y6LmN3jxNGdFDMSJgqc/372T8pPlCaKLwz0mYlU8Cw7P
         c+6xwFVM/IlEIRuANgLj84o4HbFynGBy/O5sKUukE0MPVcTIW4IwdQs038N9/IKOi7aK
         3h7+zZJS2qrOEMXsK32vfOdBFbfcCjNPEbriZvqPVTCiWJ4uNLyUionxKc5d0S686pmp
         xXEZWQuo1CDUzrpOxHZTNN4CpYzIkuZn0V/57+4OzpzrOIraQ+4JrvarCywY+qIPouL3
         jsEN8FNQEqjp7fzFk/tm61IsEVCut59/p1wB0PJJqKqgeIZiaqKNTyBWkrIosFHH+mkR
         FqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430902; x=1796035702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
        b=G8v77Sw4Ane49sI0Qd+bEoBEtfuE86bFT4dcmDV/Dpw7ZYeewwjWiopTyhW1h2CJHD
         5UFg/E6u+9LWFuKE3nDzPKFkx4IES4nAjfnoz5Ifh4iDJseu2e0WPIQz9bFWGs+c1Jhr
         mZkP+stj4+ZAi/NcDY3GAO7yJ/UuGf+gWTe3Xrr5ut/zXflSDJ09d0+0HLhw22EzoSJI
         T0MS9/bzdGLeTaoP4q/NAqPsb1OcFRUaKB+pmNHzgIlMROTTjf5DxZ/OLUyuvXyfDqQJ
         yBKu6MF50LhOd3CX3rQH54mpZqXGdWgCZpedBJQrE8Vzc7rv9f1093x5aVAVmbcrhMuc
         aLBA==
X-Forwarded-Encrypted: i=1; AL+hErG0A+ubcVZFzsjjidPacGywcF+/lFXdLlf1i0BShQTpXyUF5w6FrebcHQbYrl4cB3Vibh82cLrsAZ4XiA0C@vger.kernel.org
X-Gm-Message-State: APuU4Z8LhjljioWivbNNPjh3xh5QrXfUBfJ7boCEq7yhLBE2ohfOBmls
	13lFDEkugtBOSmqY86F4d6LpG998IMqn2nxiyPArE27gGyCUebA8H3IB6oFyPdcKHZmzcHU92qI
	OqIhzGEC+cAOzfqs3eB7eZpsstB0W+ZqeeIFpQa4A8FBDiy0IGAKODd9qisSqCOCQXo/W
X-Gm-Gg: AZFdTZfMCHWUzPES4eNlvcagbWt6z+9Qfx84LkqvhbJVeAKgu19LPEE7g4JB4m/oZOs
	9uypgMcLI/5VFRfNEwmIavlTspwhslX2AOLyfI06IastvCZAhl9x1GUIfj9ymaGw5zN9pCiqYQk
	lFU8Gil9aFtb7Yt31Z8euIJsGw3TX1PIkd18ZyJMl67QkOVLQR1baAL4QBeW1LTUn9EWmeJgKC/
	Y4BBOU0VKmuourOdIAOd3vZZ2o7nWgVdBnLZgyC+uwkmKhqIroCC58sdbMsFZwgzk6kPZNBPAj4
	GmU08tF7XbclcwouXIOeQPDj9CAmjGDxHo1CW/YoOIxwOzI2qJdH+1l8gDFTDy1H3YoGeMc3y3+
	mUa/AmvSu+JOWnaSfTmDOVMd0XuycetWqD547fB5IbFyTeoGhDTRdRZMRXbFEUsWJBwUD7ZDzIL
	Kl1vrPCw==
X-Received: by 2002:a05:6a00:a117:b0:8bf:cc92:55c0 with SMTP id d2e1a72fcca58-8c87ca5202dmr9115265b3a.37.1795430902489;
        Mon, 23 Nov 2026 02:48:22 -0800 (PST)
X-Received: by 2002:a05:6a00:a117:b0:8bf:cc92:55c0 with SMTP id d2e1a72fcca58-8c87ca5202dmr9115252b3a.37.1795430902002;
        Mon, 23 Nov 2026 02:48:22 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:21 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after system resume
Date: Mon, 23 Nov 2026 16:17:23 +0530
Message-Id: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: cetqwEg7l8eKPJ36Y9-dyxF21zZmU2Ez
X-Proofpoint-ORIG-GUID: cetqwEg7l8eKPJ36Y9-dyxF21zZmU2Ez
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX5h2SLZfZ6y3r
 BywDICMuE2luzsFse3kBS3OjPhWU4Q/XPWOvI4dpH009ycLwhAZ6pjvSpftk33OJTWFxGB8B2ub
 /xFVQT5BKNDcyuctLVN1LTfSke13mjY=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0419f7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IFn2jvwIVmFqnHeiHmEA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX38NCb8c0O7Rs
 qdS0A3uDF5LDf237BmxNsinykohwgJAohukqqVpQTrDS5A5ybC/itL16CMls7BLWGWEeafDEgPH
 T0iM8LGKfUZF4TsHN2Uj2K6lvTQG+O03nawbz89Oy3eljPIMYsOugEJIeNJxbi1EZM7lvtylbPE
 dHWBmcxj00WT6g7j6ldAmLnviM5KOMW79AjshmHXEguAqxFt/fL5JaEH3FV0vGMyRva110VdibU
 +7dDfHHeU/sihbEqR+aUq0ztPr86wBNi3nnUCkBfcm5TE9gTLoTJMaGpBRhmA//6aQQfe/38XEk
 c9WznD238hU2gR5zIO1V6wuctJ1brtTXb96FWUSNfQzU4TPNU6By5NcGrb0I7SopCo7PTeWHOTH
 kuyEeQdZIDRjy/jO+J/jWCs8ewETZJPL291GMl/fDlGYbxlk/B0KVotmYLUCjGLxX7iUsseRtsI
 +86p2s/8o6/hg0lxL0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

The controller reset on system resume returns the Qscratch registers to
their power-on defaults, which clears the VBUS valid override that was
set up for device mode. Without it the PHY does not see VBUS and the
gadget fails to enumerate after resume.

Re-enable the override after resume when the controller is not in host
mode.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 8e8d7e59c6d5..50fca06c83d4 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
 	}
 
+	/*
+	 * The reset above returned Qscratch to its power-on defaults, so
+	 * restore the VBUS valid override set up for device mode.
+	 */
+	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
+	    !dwc3_qcom_is_host(qcom))
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
 	qcom->is_suspended = false;
 
 	return 0;
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430866;
	b=O46rwoWJ3KFTEIIDfV9bBPtRvbBZb2RHHsMJDNY5EGPnKXdre5qxDiRKHHIBQIDZ2Bv3
	 8p/ukAHxpY5L3GZWvUXuA/Gxsz7mdwijfwQhq5oSLKpnnBB5V9zCh1be2JWdRg4W0mIGL
	 v83BqdhYMKwEiWQEHHgIfHMov1mT0P5zPNCdKfvLx4v5GSWXu5aloEllL68+uvdTpPWtz
	 /4ZPtxGCrytZG8cemG11FqszBkWpwrjyT7KqWTOUYWl7NnJeR9OHCGE6cqykiVWP7KuIU
	 DX6mT1HAXrsOK9sM+rsqI7NYh+0Z2yrDF3IEvV7aU+KyZAmEYpFzFJojTjWiEiLndrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tKohM3s+bmBPpn7yaP/14kf3LkHtuqPYBgkRVsYrueA=;
	b=ZJfEuGkJXyIR62jGOPe+8LXGF+Nh502T4PYwaIRw/0hwboCvV218lMX2gu3crxwcxUf9
	 ZkIAzj47bmIZvC8O1Z52i+0HZPM7MIzrV+IO/65KBmmr1EiHPYpfoGo4X9QOJBzP051KY
	 iGlpGxsrcMnjMCJD7iU1FdoZ+d702sVLTWfF/bWUmygWwo2IBNoakueaxqnG8fVH9Wob9
	 YEZvgd//j4t6ZzJZYB5F20iSqvHjs4vH+0xMb1fG3Tyhet1MdgaNozhZhiqQCu/X4czwj
	 dO+Jw3/WmVmXivcR91w4Wm4EJC+06XTza3x+OijcGG+lG3d+27+JDOl/mOyDedNwMAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y7J6HDR6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB78bWp7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D552E606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D552E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y7J6HDR6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB78bWp7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G1J02528208
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tKohM3s+bmB
	Ppn7yaP/14kf3LkHtuqPYBgkRVsYrueA=; b=Y7J6HDR6HMG8PbYebGjIdqTh7AX
	TEo7SmiLzi/3LIMTFlCp+wWHV5sxJjaD+m4eEvrYAl/gPzG5e11zWcZarxYXnxAa
	LjBalR3OxxUDK5Y04HDtbEv3c3QmRCPbdlJ526SgfbQPJncgiPxBhAn8eUcdd3Le
	2d66kyXcXrEpVujw+L3iVajrYt13aE6mfUGKJHTU/mKOHJ7AMmF2iQjEX6R8n4Y2
	sDP2IYaHNzrCWtg/36xCbTwdMk4l1LC/YxKBwzMGQORfwVyvwdXWDperkKP8GfWE
	BA30mFzhJ5zWVrInNADCBWEwHlqVyRwrpfM2ZtgxBaIQJ44RINhK9tH3oEA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7rmhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:47:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b7614e9762so2202816b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430864; x=1796035664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKohM3s+bmBPpn7yaP/14kf3LkHtuqPYBgkRVsYrueA=;
        b=GB78bWp7zS9X4LEF2FdQE3ESCovLrulO9QK+c4fU0/ERu5tf+rltyRIfWYNElBbePU
         TrX3De2L/g7EV+EwrSjOO++L4nhrtrCCumK7QpNJbZsPgFnWwn0T1r22ZSSKxPM8+4Wg
         w1+xG0A8NCJAZTQk9Ar64HHyeH09VeRYytom2kdV6PevbXKrO5WqBcvrueE8hXMD7Zhd
         8i75L3l0OFeGRnMDRPFfsIS+nrHanM8f/wv0kD/ulT8DZLSgiaAHCvxlOceSjbVjPyHY
         xYVgimk7GTObwywRT/Hm0YWI8Vn1p7Ln2/4CkgYC0gAHfZ0yNxUaq0Ue4uMPRkidRjN7
         tn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430864; x=1796035664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKohM3s+bmBPpn7yaP/14kf3LkHtuqPYBgkRVsYrueA=;
        b=jNY4iHh0v32zbme5JEUR4fzQb9m+ThILnyM7iu7A1n4oPwwdTEQok+FHVcnRwremYq
         UAKDnQmR8Lzz+Kcs9alufkHg0BWT3fgv2zsII2PAYBeMP5tTpsvBNvovT47h2pguOfOj
         1Mr/iZ274Utx7LOoehh41H2ouotQHHErhMv8uKw2WX3cHSj0R7gUCOqcLbXLa7URJVf0
         Bna/Y9QZJw3MJd/nj2LNDRF91Gk+Kk+rzKqF7neUa3I7Rmfk53za9WI1oWi78t9GCE2o
         2fD55e/mXtUilnQPAWhXCBxw6gmeNFG35wtKJlIJ6in30RxmZsfualKpjbGNLBoQOt2/
         pK7A==
X-Forwarded-Encrypted: i=1; AL+hErHm5GLPZzu0pbVIWuo7esBE/3o88P98TW8mVGfjhiRmV/h9pWIoFHXWKYSHSlSeBa2iFsdRKivLrfIgAa3u@vger.kernel.org
X-Gm-Message-State: APuU4Z8FKoPtpYVy8qSZIi2wVXoszMO8aSJiutJ3qd7r9EagK0j4wT6J
	voa0yt4j1O47Ob5xEkrkTKsc9P0SC2MvbyG0dZGwKk0RPUzYj1th2z2fhpQayk3tU0hYNbAAsgR
	O1dzjKH4VCVl0pBPGViZJPq5T3n1t81D7KOHiOwdNz5bDEs6hn+LToWVLtwAlw129FB3b
X-Gm-Gg: AZFdTZcbalHs51xYm2w845s8f+ziwogOwJi/LgGLUaNXhBo7XLlWFz00ZOpSJ2bk+kv
	5tep+zg2N8m2EbTiWQqvfFbtQjwwIjk2/u2McYXNZvIrqFmyvUYH3pL9rGw7zYNtQJ6qDOC+/MG
	8Xcsn7kc0fqTzZQvJUdHVWlah9TmWpuzdkOwTFTn0B942N0WRr8PMJ6xVA1NkKEin0wVP85IE/2
	qTeUzSv2CWXD8UFdjynrsc0+finFCd+0WoYOF9UDnOrpbqMXTAqbAlQODtPVuO4k9dlKRaixZAw
	JGtMwzIS0iilHGYpuAHqV5eQCcGRTg99R6STHGMCh/a3lZRvbYSSR3y/RikaCDCZFpT4qdlTHwq
	4kKGkYRV51mNIIYS+h+iOWCbdPRL8vR6100C6pdkvwRtD6ZF0CVjloz8t2JQCi/FqcIkoTTPq8h
	QVjMkxow==
X-Received: by 2002:aa7:914b:0:b0:89f:1b32:29b3 with SMTP id d2e1a72fcca58-8c8792a498bmr8816138b3a.5.1795430863720;
        Mon, 23 Nov 2026 02:47:43 -0800 (PST)
X-Received: by 2002:aa7:914b:0:b0:89f:1b32:29b3 with SMTP id d2e1a72fcca58-8c8792a498bmr8816122b3a.5.1795430863245;
        Mon, 23 Nov 2026 02:47:43 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:42 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 01/11] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Mon, 23 Nov 2026 16:17:16 +0530
Message-Id: <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0419d0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jIQo8A4GAAAA:8 a=tqe-1LZTDOhu2qnNqD0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXzyhb0IZm46Fp
 VAswV8rzshYNbfAFLFA15wdWQxm9KjMZ3/YYMf9ufbzf2+EXTlyFoiVSueq7V5bk0bKzBMNABfY
 9HmKiptnJyIV4cXZjBAvNJfLQ4aK7LO876ArVrfnmPWfmy0dGtrs7uXEP5rz/Wt+0qx68pl+Woe
 hby30YkxT4WUWByaZgZUlAi/bOP6t420RsvAD3TAlRfxED11mdoaRalokLT3s+mX3gLRnaf/sAr
 r4JvU/NDoTU3qPt9SDpwvvFumcjlzybPnNqaU5k4gFO+eip6djyPPwwtQDIDkh76B8k3Vl3Mocl
 LfS7Dx7qZ7v0ajonJySVR8OMBjVjeP7Hkn7ZUshGIFh1QSCJN0S+KIWCYBLK1YDD7kpsa7bS3nJ
 zxhHuQFMJLChSzUvtaTmLT//1zkDpDjbFhSnT0R3HBwVoN0bYgq3w7riJud77p90Cpm3KrBlU02
 fSRbxlLojwooPpN/Qfg==
X-Proofpoint-GUID: 9YABBX0emXe-hLkQnM0DWvpz8RPVDh0I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXz8zGOTHsZXET
 +EHbGHnUL4J3YFsWmtxCV+BWxPkDCe8V56BsIRrVnpwtH+UMsAmwlBMEivbYqBqXl3TqSMlU7Xz
 lCMMhR1ZCKz5TepT7BA8IVUrWJPQXBw=
X-Proofpoint-ORIG-GUID: 9YABBX0emXe-hLkQnM0DWvpz8RPVDh0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
handle both system PM and runtime PM paths but cannot
differentiate between them, preventing distinct power
management strategies.

Refactor suspend/resume functions to accept pm_message_t
instead of boolean wakeup flags. Use PMSG_IS_AUTO()
to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
system PM (PMSG_SUSPEND/RESUME) paths.

Preserve existing wakeup behavior: always enable wakeup
for runtime suspend, check device_may_wakeup() for system
suspend.

Follow dwc3/core.c pattern to enable future per-path
strategies like differentiated power states.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d44f093ac243..7a7225b900b3 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -335,8 +335,18 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+/*
+ * For runtime PM, always enable wakeup.
+ * For system PM, check device wakeup capability.
+ */
+static bool dwc3_qcom_wakeup_enabled(struct dwc3_qcom *qcom, pm_message_t msg)
+{
+	return PMSG_IS_AUTO(msg) || device_may_wakeup(qcom->dev);
+}
+
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
+	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
 	u32 val;
 	int i, ret;
 
@@ -369,8 +379,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
+	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
 	int ret;
 	int i;
 
@@ -750,14 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
 	ret = dwc3_pm_suspend(&qcom->dwc);
 	if (ret)
 		return ret;
 
-	ret = dwc3_qcom_suspend(qcom, wakeup);
+	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -770,10 +780,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -810,7 +819,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -819,7 +828,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1


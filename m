Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213993;
	b=ncResjcjd88YsohgQue5tEt3K5z04RYQPQHpCHqlOqkDzncxltKutolLz8Xw2wyI15sU
	 wEQffryD75MhK8NO5goN68xC/ldMhiE1/CjiHbZ8+sBiZIr8vIt6IYxz3Mz5IBTWDhyF2
	 2PCnZVVqUtY+sr19q10cGDbhA9TyhX1cL2lyzjRaBw3iuDSUmg1b1LhIWX12EK/2S117x
	 ZlPBVqqq5UuvOU5tZEjTzJ6GDO8Fkxv4y1/GLwGjPw9W1MzxXycqFhFEMq9pgkgrAo0Jo
	 vFd3Bos/2wvk15+VEF63ZACX1QSj616oDSn4jQWCtbEeGrVt+3kIjnzrPEyxjtHGuOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
	b=2+xwv5EKxmcM2kN9GBmV6EzhNOK5/7DHXP5OH4mX1v7i1bXzr0dZCDZFfphLebnDl33K
	 7tKCcRdbdKpmiU3MroVx+yHFCRKXz/OpGt90+wR/1jiXRmTdibr2rIbNdiMraSrJ8VERI
	 lz4dVml5KYrbotDWgRvIkTICijFTMMUUIKMofN4lQbqxayLOGQ21AwJ4CxbkVpVyU38Qs
	 srSCyd1Uwxc9S7hEVXslnSnQ9nMQa+aegd7F22x+csjwVrkKS38cgaf6LaJVJQr8nTuFQ
	 0W3dqgEMjbQs4GNEs2DJ9NgA7Lt3w/n5NlVzjAIQd+x/PJ3a6nAqQXDIETIM0zJVBzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLLHmiL7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BVpg/oIh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CD5606A33D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50CD5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLLHmiL7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVpg/oIh
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPpGH1580508
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VfDVxALSW97
	OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=; b=YLLHmiL7LRRFAS3o6PkkWiRyCpG
	8rHz7D26TAvIACIOESgrQRz5AV+p2PTt35heKebPPNW1ttNNDUkfvreuTq0XK+FI
	eMI4W0ek5YpuuG+NnTwj2AFjwiwmMxHImX0PviX0Ko28GIOhMcpV7BaPLrCxQlzR
	ufzd3Zmjt8SJBZeg2zcZk7sgv0hWINzNSH6C6vHQnLKqfK+PAk+Ni5WAN40FEA16
	OAX9mZhycbEVmTGn0WeXcf+kqNYk/xGXaYPXWI1omHNaeGiDAOs6fh0iotMR2QFv
	AeKsWA5+ucPGS91/PeZogGpZkqaM21bCIOd/zWCuj8R+xFFeiwn8EpREI2A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkp8aur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:59:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so1942305eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213991; x=1793818791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
        b=BVpg/oIhuvODiiAChzNftA3cS1BCyRhf4Bly6jYCfcQG79ygWA+8lSLjenBc4BNlbQ
         b8fCmGxqZhnn2/aZzQg94vNGrxKL2fk0Ai7ufi3pE9HsgUuubM2TNQsvzbiOBdxLyh+2
         VHAZum7SUHJo1kcRHj7BJ6UWAjT/sCP7XJbFmSrA4a7V3EtIOkz/9vL4hsBGETP6NOio
         Z1dltUIHGF6Mc3mf1qv3NAIUVcUfhgcZ/arUG3heKFwvvXBTS91/cF60qjXPxONFW96l
         Qp75+0V/EGILjJ8sMT5IJoePD3eXeOn7+cm6lMIJBsWVgk8wlhgti/akBCd0YXJXJJPu
         IOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213991; x=1793818791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
        b=vXkRQ+GlHsEjMJG+vnAD51casVyOm+EDJeHyQAAx7OzMk3Ngkt0ea4rNYmgpBqiHYa
         dUAIsYLiGOaQKcDx0AJg8ctYfPDyM4cyu+axiND3SUuAbrdCLHwa8fLcD3Hj9snOIh8f
         fn84/McVjZBNRyCuiJ+LoPb5P/z97k/saxEXFduFG3Jv0V7GCKUnEwfqWnLAYPMwVSRG
         ehJEdu6ano9Lnm/u/fF1Tk0ATA8bU2xUMDUX2hwyeKtw/LziMGP+vC/JnWXibqzGLIJ6
         Gu9bJFHRKk6t3bjlrNWxNgTO8nEMiigGgWoZefqDDsaWGF+K6a4DNsZzSnLRnew5ZBAL
         Vwrw==
X-Forwarded-Encrypted: i=1; AKwUvBy26NWAFtp/QWKJsfJJ3GX4T17xRbhBSCqzoLPWAA9EVFr1HJTKKoXvdEth/rLDGkcBQc1uc3tzCOIf0IX0@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ4eA/U3rK1qULpaGdlNuz2eijH1T5d0mVVOqdqgKJB9blJW1d
	mY2ymQLgYA8heArroyFp8+sqHDLTwblTVQozAeCj+tdLPl6jeK1WuNaQmXbObhPVA0OoQjQQ2jR
	hqF7GzkoX04vl0aYR4WD2x0KkCQEjNn+F8f1/2gQwLvCUf0pqLVX2RacCTL4TsqWMyuy7
X-Gm-Gg: AYBFou3p4bXBg0OChh1n6O0JnW0wJDJH3FqDEaEsieFURTDAnmZblUG+C7AMIrRKM3a
	FPV/JQztix/js4RoqRJ7q7sWp1iP7C3FdhXll1GUKzmn17pijFr7runKfGcDY2kbqvd4nhREnEC
	SF1DBSx/+vmmwALvnY4G6+fqdqQzuMoq913hPz5qwzPKztDw1jG6pLFUvViiwt1kxP0Det56ULy
	U9DK1xEFnBP58nj6lpPmLkqOemWrDBZUpHu0BeuWsC8uFgrs+TaQW/447QJeVAsD29xwtXcTrfi
	fUliN648VbdSQ2O1lHa1agW3vOUHhU6CInjsmSEY67A4y5EV+aDRT/g+ZiZc1ZCN+CJ7J+SFvjq
	HmDtxVkuCn/NsuOpLzaXXzPbdSNN2W7M7IYKufWSiapH9KSbrTkBvwrvmC4vcq+huDWcDn0aHU8
	7Iqpab5Q==
X-Received: by 2002:a05:7300:bf18:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a20443a5emr5127237eec.41.1793213991035;
        Wed, 28 Oct 2026 11:59:51 -0700 (PDT)
X-Received: by 2002:a05:7300:bf18:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a20443a5emr5127196eec.41.1793213990474;
        Wed, 28 Oct 2026 11:59:50 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:49 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Thu, 29 Oct 2026 00:29:32 +0530
Message-Id: <e39a38d334b5276d8a47b917b1f0fcd0a32bcfe9.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae24628 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jIQo8A4GAAAA:8 a=tqe-1LZTDOhu2qnNqD0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 2mAMnM4mUBFSaxv679tIeBqYWC-u3Pf1
X-Proofpoint-GUID: 2mAMnM4mUBFSaxv679tIeBqYWC-u3Pf1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXxT0eH5ya4PSy
 vGtHzVYqFYnybCfv1mapsyaZFqmIsq/O3PHfxeHrnNmEeMqnHC1ZU4Ev7B9S7NQ1dzLFBWsfKC6
 2421/HnELvTwlCu4Y7Zg4VxAPxBtR/s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXwPeWPn+DAZov
 23Zo32Jsi3UBx/+KFZLPPvxhNC2UFnPXUSf7+3PX9xtfnfhridoIl1jx09PhK8H61MNexIywRii
 5itLUIS8MXBltkd2ZixCoyeh/ixoa9r8dSkVULBvN/587+8L2NwqhLiNLMcl+1dSu7UcKS6L2Dd
 nm82VixudhhPkpwcWMSahpZBWkaCp1DVoNO2WZKLX0umcHNrdc3zGUq2VOyMcbDuomG9I7D1h6Y
 1Dkhr++r/XmbrFYXiH+GN6yRWV14koDbuK9/phI6ZO7TJD/hUS7EkdOELXyfocW4VEIGieEa+fg
 OpX1Hzo0HMutZp4/jFMAO5HkvRAJBs159dDtMZ6RSztla8dHPeaCkJDy1EvRr/1/4YjEy40Or5E
 U5G5lhwL3pLs55jTWDSGOr1ueB3gjyRTxpVvOGZzmYj1pd/WM72rgbGSi0unga8RnZgCqRkEx7q
 KTU6IApvWXvT37QkUnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280075

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
---
 drivers/usb/dwc3/dwc3-qcom.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d4fda4dd81f6..508b1ee7cd0f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -346,14 +346,24 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	qcom->wakeup_irqs_armed = true;
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	u32 val;
 	int i, ret;
+	bool wakeup;
 
 	if (qcom->is_suspended)
 		return 0;
 
+	/*
+	 * For runtime suspend, always enable wakeup.
+	 * For system suspend, check device wakeup capability.
+	 */
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = device_may_wakeup(qcom->dev);
+
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
@@ -380,7 +390,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	int ret;
 	int i;
@@ -766,14 +776,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
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
 
@@ -786,10 +795,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -826,7 +834,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -835,7 +843,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1


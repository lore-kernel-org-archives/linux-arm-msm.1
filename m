Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213990;
	b=CiaivIVNW7r06bcBl35BU/1iZZQaVrCMnT4G0JfLnFQt0YjtJJsTXa3RsVeGt6rzbS/B
	 BA03nCDlTQYMg7WNGymrxECXw9nLwOPzexhqFoqBwCetQReV56p+ILH0jSvL6aDuQxEpE
	 NP6r5oGV7SONW6Qm4wGiNTw4KZDUng47Vet9KN40dG2O/x32+w348Ysr+0M15opOjfrjH
	 Wf2+t/P+ATbeWmozqFmeKDN56mZOkqOUvz+s1coXWgt2Fd3LTMPg6W5GCPRYq2+gg8+gS
	 3ajx3QPddGWPeoDTc+72H/Ck5HtEKILAj/opCkwlVrNiHlmkU98Pwjwn+wXkOTXllRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
	b=LGFuB36TFVH0estj6t0c8tDbtU87EjFU9g5qqn/v/unUCdSL7i9l2IqITb/sVEwCzvUX
	 P+Aha5sSTZeZ8m6lBkkonGBFX0x5+72FCJ0rfQth++HGi8qXW2YjYKaHkO/fUYK1Cyz1f
	 MCarUqSDxFwGRBxh6lFLMjIMaRZYyf4Ic0wRoFfZrcunKC/V5El0vF424gj05OPoBx6B1
	 k7ayxQPEtahJEaULSusPcRph0Dk1PnApyAQVI0DaFcvNUQlQ3/Ix10TxNiQcakUhAh8bv
	 Hi/rP2SEu5Uhtrf27aKO+bTcLL5sWkyYY8l9toOHx6HMC9P8zPBW8qOuST0aqljrlRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pIhyG/vn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=We4tUeLj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99128606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99128606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pIhyG/vn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=We4tUeLj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIkJei2546880
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KgcDUP83Bl5
	a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=; b=pIhyG/vnmam6DilkyHyPOyvYlzT
	/vZHuBjxwY6qGjRivCp3/1plEEIwEyuiEUlmVZYwLicmPhIsUaJ92iKP5kz9Hwta
	9HIe+KVRjIdGf3ErF0boW+GYPrueX224JfkEEaqGSUCA130gfTguo+rD3SuKa+vW
	l3XF/eZPnkdu0OFEDl7cui7/BLwQ9GH3oNj+KxumcnT6UQREbktrYK4tloI10RLB
	6XOgD7zCx7qrhjuut6KopOg5iEfP8mN5wX3aH3JSBNBsKHX97UVLTWQ0uU9MCZCN
	saf4TKLzS4kZpd8eiPlDW0P65ZD0NDntbEGPC2/5wUBaCmnjlbYddpuMLGA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc01wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:59:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so2545322eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213987; x=1793818787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=We4tUeLjz8FjUuA4EGKwdwgGBkVlyeUdHC63vVJKvS25af9aY6uoaTNQ9dDoYzjRTO
         Fdl8AQbiKC5CC/6tAfJTBH1Lohq2rfVQQDKpk+/QafUpe+QGew52sLcO/+jWXr/Kjt0j
         YuogEa0fBl39DP6CIjrCUg+TDxnxZwUYm/i6r7sUJtfpn5TU/Zku9MUFCkWRzMvHjHSk
         9R0SG+gTaBSITVa7JkwuI7QGZo5vUDTk2g3gABNmHpiRQ07L1idNmli+t1yfb3MBylOC
         j4iTlUuBGDEG9lG8X5sL4QXLx8H+pvEFJZeHGB9bQhnzP96I3m+wsGTeVBGjMkG1W1Kq
         YhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213987; x=1793818787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=uOkuN/xjnazHGk7Ir6O0/wfZ01w3wwCbVWfZAiv2HPTKtyA70tk6Zdf6FXpqncTven
         k+70xScvVG8pQJPoK0TB59uzrUgwHzr2WRG394GlJ38+afiHs0dIIOrSrgh1Dqqz0Bwz
         LObMoD1o//2lW4f7WhnD+B6eEDfwu8Kb5k0dghWanCnNVFCGSe+7dQ9UanRgkHv7GYin
         LxNmODeQGw/NUjPS+dbFzxTj+Wm7ZXQRC6t1065tCgncytewnBmtwJ0ycLYYWVp3xmZe
         aq7S9CtpBSVbXOqKCbkDWugLz3uf8ltajw/ntMTWE2zjtWAUMkBPPT36QjLPnyOTDI2s
         HZRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhaEu2P1LM2vlQJS5AXKjwTq04maebomDW/rSYUXjwVwOWZrh0uisdAdLENyPDwuSbZ1Bm4qagImQd+aN+@vger.kernel.org
X-Gm-Message-State: AFq9FYLTk3JU1J+BR1Bedw/OYLZFMPPJlq16pz+KBUkM0cJnSYm/fyo9
	DHGutbBND4d232rRAoRlYZC9Y4peXkwHcdnWFtCR2Rv9X5qWqal+Tk2+AI8UYBRPaug5UBNcYhl
	hR6QhfZqf2MsIDJt1Iz2FFGXPkq5ff07c0MZdylNrHjWrdmHC3hqeIgH+vd0eDFnw9jA2
X-Gm-Gg: AYBFou37pmvBdmSRvo7+q6sGmqlhcZQeOvGcbtYq76991VGK4DqtP6f9gOzbwvLkdUS
	P/+txWg5eV2rDE/MJhALwsNU2T4+iz+83kKZl/BauUaTUqp3SpoKfriyGTCgKrYat7ToTR5yYui
	m/zHroTptiIF88jUrG995w2KLutdF+ZB6PP9N9gv4l6KGVgyWcIWRaeFZYbTgVzpLtQ8C/2J95Z
	rARgLNEOrn+xmSYdybRTPwvs4DGlCVHyFaLQoukz/kDwiDRNi1wYQoueewDCi57UB91WFepNBkM
	3lesnSJJH6LH0IDiW2Z05t6xR2vLx6Ty6C4grWNDEcKTsuVq8laYESDZKg0hYZLaB4UVs3xCLW1
	qCu5T5kDZyz/v1KgJAkFaJ3lmqR2Z4tStlRAmC5Q3XKWC3RxrS97p55/sGFq96nVqJKe1mammGY
	Wh4uyIOA==
X-Received: by 2002:a05:7301:7e0a:b0:353:7e33:664c with SMTP id 5a478bee46e88-36a20401baemr4316295eec.37.1793213987058;
        Wed, 28 Oct 2026 11:59:47 -0700 (PDT)
X-Received: by 2002:a05:7301:7e0a:b0:353:7e33:664c with SMTP id 5a478bee46e88-36a20401baemr4316256eec.37.1793213986385;
        Wed, 28 Oct 2026 11:59:46 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:45 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed resume
Date: Thu, 29 Oct 2026 00:29:31 +0530
Message-Id: <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae24624 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ZXqkfniAK1spq4Hy8MUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 4GpXCUpa9ciIwBwW7MMN-XpO_5kklS1C
X-Proofpoint-ORIG-GUID: 4GpXCUpa9ciIwBwW7MMN-XpO_5kklS1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX+lnZKuSs1ChR
 uM+20kIij5FHPj3EgNIPRLirAyb2DnLMqiZdNC8FNZbVN8SEWKhrr/Zlf8XiXwFwZVLZrgUThRa
 s8QdTlkG93eZIrxcssMGEgF327frldI9SIqv+A2Sza/tO5fkOgDYwOYrTM8giEn41vQhZN5azKE
 JiVYumD/2L91BgVwhvyAXqAdPRFhDko3DRycOAKxRwaUXreQmKD7nWPnfwneTFJ27jZLIKa6Kb8
 OPq87h8Awwwf1J7AO9EvEjsAE+spE8LpSAGerguA/nC6N6TH5Ei9SppfnDjjCVHNew5Z/grIag8
 g0rEVuiotdtWpPCdWKy5O0NS4ZdXYAIScjLIGrhb/VaagPGB+I0PNwnqgDu+VfGtmeHjI5iegIB
 52GzO+gmA2jUUUJfpimuQTrLFTN/G2S6530jLEvoSAWG7LJ/8HWfLDGCW3yqn6kwyZlm13Afq4J
 QCrb0tPI9Y5n2pww5kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX1kt0YDuiDy5L
 Y348t7I7/K7RHmVWlZPAmwF0sxkDOgy1IvYm7Lkn2j4IH4gk6+iEnxzVs3KudwgRAbHIE3d72rw
 95r8KzE0o2++IsF9DZC5O8DcBJD1jyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

dwc3_qcom_resume() disables the wakeup interrupts before enabling the
clocks. If clk_bulk_prepare_enable() fails, it returns with them
disabled. The next suspend returns early on is_suspended without
re-enabling them, and the next resume disables them again, so every
failed resume leaves the disable depth one level deeper and host-mode
wakeup is lost for good.

Re-enabling them on the error path is not safe either: the
level-triggered ss_phy interrupt can stay asserted, and the handler
can't make progress while the controller is not resumed, so it would
fire continuously.

Track whether the wakeup interrupts are armed and make enabling and
disabling them idempotent. A failed resume now leaves them disarmed and
balanced, and the next suspend arms them again. Disarm them in resume
regardless of the wakeup setting, so interrupts armed by a runtime
suspend are also disarmed when system resume runs with device wakeup
disabled.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d44f093ac243..d4fda4dd81f6 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			wakeup_irqs_armed;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (!qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = false;
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = true;
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	if (!qcom->is_suspended)
 		return 0;
 
-	if (dwc3_qcom_is_host(qcom) && wakeup)
-		dwc3_qcom_disable_interrupts(qcom);
+	/*
+	 * Wakeup interrupts may have been armed by an earlier runtime suspend
+	 * even if wakeup is now disabled, so always disarm them. On failure
+	 * they stay disarmed, as a level-triggered wakeup line could otherwise
+	 * keep firing while the controller can't be resumed.
+	 */
+	dwc3_qcom_disable_interrupts(qcom);
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-- 
2.34.1


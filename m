Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180443F6C42
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289274; cv=none; b=dc6TQKRCczFDhQMyjS32qY8+xO/PhKhiwM3C0qS9hTpU8zrHK71i20CP3VoBG8zYHcl04XajaozOpzcUB83FDsComK4lDx96POuMLdRDJ15A0Klj3Hz8XyDvjIAL6xkALRiNS165FfrKhjTTsVqQV0L6jAr/dqSGcDtWxy8jfcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289274; c=relaxed/simple;
	bh=2peO1UzbCuiCWCfh5/yhDFVIhUsKbwIhtUGipgPIZ0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Exx3md0/EkBgGHJa0JCkTtnTO/KG77fsR7e3a70/EtgZBJ0TS8vOvwnDjtKPjZHS+qPLK0svPDlEItkzweA+emBHzOyNs0RNgy+6Sl3BPU+PJwMo/3Dw+IbGAris6nejnSV0Kpw1UBR0Snr+/BmLgqChHdRAFJnJiZJzFxMtz1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7UUR+Oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9zsINft; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7UUR+Oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9zsINft"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASk6H1515726
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHgN3k7yEtvVmxJhHXt/vaaI6tULP6wgCXcb5yrgco4=; b=O7UUR+OqFzPV/p9N
	wkARkzPK9kF4APsxn2jj4bw4kezy9RR6XolJUh2jnypmr3W/Asf059BN9ir4vH4k
	D9D6Lzmr8C4FNGgldpyexyz9uKGvJqth7pCM7mwbu7rNBwJk0oc/tBolxUw4IYUm
	VocvkcYGcbioTa9oAWSUOP5eupz+XxFKtkRNipW9Rn9LHYh0d8GY/QbcKd7PH/eW
	JzwAjBxmKedRczAgNiD4cxesX6Dq0zpkAtIAKX+1EwifCBg/momZ+uDnYMSCQKoC
	4kxwkef1aYb+xke9UoIrI1skgREhIdiXe/n0Sxhr7vb1rEQX9vev3FQLe/tnNgI6
	ryNWlw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gs61m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:54:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so52310935ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289267; x=1784894067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHgN3k7yEtvVmxJhHXt/vaaI6tULP6wgCXcb5yrgco4=;
        b=K9zsINftv0X/baiwOXtPF0b2pSV6Cgr86AZ7xI1aHNSLxs6QPLJ65ERmUul4E8u1e6
         0cf5U8fsta8TJPgZK9jfYqkJG5FGxzsys5jYGkuGkvRSNIQye/XCsBJtW9DxJ9CkpUog
         gSFh9hYw8TrMs42dSaFAM5GqFETgpZYUMqqXtY7Fs1MAKzt8Nu7Ksj0n3AxznUwSbgny
         9UxapRVN+3AvUoZroO6g/nlNy9TK+lCld4iwbV0GncvaS2N1Dp27lKOa8Tsc79tNHaY1
         B2umoDD9rD8+NBCjmUlZBj7vUCAq1wjiu9AAYMFf20ktT/LErmyBIR+VaoHo6cUrV1d8
         0FaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289267; x=1784894067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHgN3k7yEtvVmxJhHXt/vaaI6tULP6wgCXcb5yrgco4=;
        b=DJhJAQOCMRmBhnijDSUXeX2rDWrLlBFVoNZzrkh/JTTfSHou3UIjH4hhwuSrrKRvBn
         1EC4TK4DBvfZf5z1swYQlxeL4TIbJ5tu+de+EqgIjHZMN8GfwCcKyOSSeuhgXNJTo8GX
         Jkb03X5XjoUqx85ZwcugS0qsM95gtnQ1smfTXxbN0gEfsl3NTd7qWDoyB6ZWZU2oAtwz
         hpuSdwWPr3SotuN6QeXio8BpC/GY1QrewUgZ7pkkdZhNTtoEAxjb5mU4rWI7E0vrQ1wW
         whc1agGBNHmdhi4Iffx0Z1mZ6sWK4AkVkhm1rSDNWqhwxgTG4QTmnv2zZLthKzYTfKnf
         SdTw==
X-Forwarded-Encrypted: i=1; AHgh+RqSB4i7uvirWU7BuVWJ3kaubau0itcwetLz0qhkQY1tXbXMMMmmQ7itlr2WivnQyWZGgHBntztVNPtcwO0E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+jNphRk9Q2PT5mid3YbGiZDD5xQBVP+xS7QfvNFko1nUe65V
	3qdh/Yt5kYXNVcB9RrYmEdGPmrSphqjadvBj/WcPJEOOy2tlfJPE/6lt53+oGFxihAXMyixbK2l
	cYrzI9sAGHUD8sibpnnEqKDVzKrv/JDs91DLuxTQ3aW2Tdy9c0rC7nw0wuXosii14sXzm
X-Gm-Gg: AfdE7ckMVh/UMDBxpmOVV7XajJqsdKZFobAjbuuR4VfqhfIMmcpwCHe9E4Kqx0LUAeF
	B5G9ZhKxRd6tW+qR5NKNJXjPcRLwU1A3ZWzsk3In27rIcFvcSSbvBy4QNOEDoBXl/H3gvk3Bpyq
	bfK2Zn8iPGAZeKdHKPpBZ36lbGhD/gbEhMHKqjxdK+g+rOKkNHFTz+4DjDKJh4uiP9rrH4y3Y8z
	vTE7aRQM+PAhLtBzcLgMPoxEb2E6RTVmIXoGf3poyM3MOSpsFkOBLPY+Z2hzueB4F+zgHfXbjMi
	Dmo/Uju4LDIX6Xv2DP6wW0q2e+dpUfaJMFsoXjuKml3HtLrMxhy4KrMoqEAo1LHRtdKG4ls/Fpb
	+8p1i5UceKVxUkpebOXU3B8qMvO0p2725LjnUXuj8tTwPMLnZ4Zg7xDFfNQkPX7CL
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr23481275ad.32.1784289267077;
        Fri, 17 Jul 2026 04:54:27 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr23480925ad.32.1784289266603;
        Fri, 17 Jul 2026 04:54:26 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f12e0sm9481895ad.31.2026.07.17.04.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:54:26 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 04:54:11 -0700
Subject: [PATCH 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
In-Reply-To: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289261; l=875;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=2peO1UzbCuiCWCfh5/yhDFVIhUsKbwIhtUGipgPIZ0A=;
 b=huZ2fCNG42gsfQCat0t97HckTjzfs6nImeiK0tPyUj3//uqohqYsVfyS0WHPnsMsdQiFuhhn9
 mDig0salrerCg1ToSSDSf0ZzqIryDIUB0kx9yz8wgLJmUKbh0dEQzQu
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX8jK1NeABxN5y
 SGmHzToAA56O1zCDg83bwFIxYk04njPTJUcADLIgR95Ir/S+PYGWb2I9BMGGR4V9fk54Dek0oDc
 1zQ1nvD6PUwpUbPWlX0uN0Mf8KOGvF0=
X-Proofpoint-ORIG-GUID: KheDZoNkbtAmjaeXqKoyb7PyvVaa9tyL
X-Proofpoint-GUID: KheDZoNkbtAmjaeXqKoyb7PyvVaa9tyL
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a17f4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Gf6kasYTCoD6TKqZ3V4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfXx+sT+tjjOWOZ
 wCeOyK24gIbvX9UzonRJx4B+tuEpJSvOf1RVqeeIIQ3JCLmId/3IZ0b3oeovHoNExmimF7jgF2h
 CVeRxsy33wlmMRqyAkdjMHU0AQZJeTduJ/5j5u6G9Jx5lP4//jg3B7MERGtiWsJ8wEYhIlCpWgO
 l8eTWeG+Dy9BKklYQow3+hW+fRtGbAaoX5vAeHkpiqVOa4G7hmZKdmZDuwmwMCK0melUExKKGsv
 6osPArkhwVB/Nh8PoqT/NGgYNaSP2HeYUQj1vf1iMKKCq+HIqPf9CNZUrrIKcCXuZQ46hFbwGeQ
 qy6FjqOEEvncdk7YrrvwHTLx6UA3RR/x5djA6VE844aUv88AfPxxVLeC+cLkYn7hBy90Wnf3HVI
 7XKrb5Uoj1DwWdbFi4SQiryK00xmzgk8z/PBTxH2VBm40T6E+AxVm+2uAr3GjdnsbLRmN9HSAVg
 l/2WjfHozGfuoJtiWBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170119

Add Glymur QCB board to the QSEECOM allowlist for enabling access to
efivars and uefi bootloader.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..e0ea40b4302c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2326,6 +2326,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
+	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },

-- 
2.34.1


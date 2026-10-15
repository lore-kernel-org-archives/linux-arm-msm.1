Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F38849E5CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048540; cv=none; b=PJ66V05eVqtVXtskuBl+udZkui71MyMrvD4DqEDBVvMwBFYx/8NyXbxDM21fd131cDdiLyDWTyuYzDP/8bzdOF5l+nPUO9uExJHbZYe253T0wwkhc0ZwIhAe8i8vpHFsPxCqmOa5WIWPAhCPreHdjSXYwKEfG+CoIjITQF/o8L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048540; c=relaxed/simple;
	bh=zTrQ0pnN7G23f4y5+DEkzLuFDBliETbsQnTkcWQjkzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t5O0ho2k7XAqp4R8E8B07LtIavoylHeB1YrhL5V7nHiTvdip6p3n8dAwZp1Mj+n3m0OQLBqwX2ze7Ss9ljs+/QVOPopr6v2k99rD81oez/+8sP6cGHng0juNgYFTIGMZyMnOWK91VeN4VQmAF6ogo3rNt2G9cmUjq7eEXMPa5wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PAS7w4qu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeKtS2y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAS7w4qu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GeKtS2y9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6IcGw1682878
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dcmUFnDKtfp
	Iw0d7LSYds4+3SyLAxv2N1/UX8KL9lgU=; b=PAS7w4qu4x4N3vmYQAWNk+T5nUW
	CIqAO3o3LglTr6nfOytdL+JPDrSyJDQ/30xTCJq866jS0SUPUFrELtfU8c9JefZT
	OxHll50hrFIajgDHjDPsyXTz3ZPFY63yRcgKdTpDLlQDVHi3XNP55NsHjRNjG6nz
	al7TNZ7sbC8YUURR8VUh/+dOBA88kQKTJ1Azk6w2kJX6hyot58soxLZdnTJLF0Go
	gAr8Chv8oe8MsiwOoRwCkpUpTJQdbQdWhoGMyJsYmRXt5SD92Ld1V1Tyzpnv1zYk
	K/GyAhj7c8NqxQU9bifHwCCVxg2kNSJJcdjLh8aydnggGJQJx/mYNa+6JJg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb037bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso2435445a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048524; x=1792653324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcmUFnDKtfpIw0d7LSYds4+3SyLAxv2N1/UX8KL9lgU=;
        b=GeKtS2y9jpDpGT13GAw8RE4OHO9co7rGSHr7dwWUrKxFejU2CQJYXjjA5O1mPOb5ZH
         /dZdo2s3DRyHtHyH6dh5v56l+eBesz45vNW8fL1/nJZnCWsG7MQh+sWLFQpQBC7bbKeD
         OYkdz2DLg2yLLNypZBe1emuUDjkuouWCkoP2Lc0ErDhjGTNggWPOn9V7XJHhmQtH8AZn
         VUIMMY1u4mT1WfGQYwezprNtKmFD9J61MSXPJJGJr8qn/oJrDSdfhqnMBh3TjS+SVoUo
         f/u+Xgx7bnKe3yCSXyZHMsMAV/T9An3nWM/7uWogC75vvMDDadyFpOFvtjJ0zY+cfM9Q
         yvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048524; x=1792653324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcmUFnDKtfpIw0d7LSYds4+3SyLAxv2N1/UX8KL9lgU=;
        b=SfS0PyavMpOAlfUeHZQkscI7XaK1bBtc0keHOLzKRIIChF4JG/fpaDe9Bme6MwHqnK
         O3YXYlnJ3ORNOAh4iBU/lxBMRgNxaIkmysNUz1/xQw/mqhs5lk3uVs8MkK0I6btFwbXa
         V9p+xxspbMrAPcctaDmqCW1Bv/YLHNXaGVBQd53WMnL1og40F+04fIQw+nAtmt4q8mhB
         e3+TWBU+UEaVLiC6GkHT41QxFtrBDd6eCRnACYAmcL4v8UvkaFR8tGrRkc5qz6vmnybJ
         vOEOG/5Q3bd/x8kcdGObvQoQCmkuWQiordbUlB57H7PEjGQqzGNMgo557Z1OE8OQC/Ul
         R/mw==
X-Forwarded-Encrypted: i=1; AKwUvBzlZVlmYFfHVbOT4jDhLQAAfwRze0eEzTaWnp7o2dyHJPemsXHB4BuhbZ7m9pIPbMgrvPLiNBBR9eMPqMXZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJJnltErze87A7bReOWNKjbZxsVC7S77G8LXd2KM7aPDbdKuQcP
	E5nfg61SdyzQgOJE4OJvRrTubU3e12Bw7LU9eoMBFG76h9q4vmB+SZYHReJIKGwnEmP18bWToPg
	RJgJ488YrZK6HqokeQULPrKynHsdrdAHUQLVlXkAksEI6OFZGCf1y/tq44EVgIzekxDXn
X-Gm-Gg: AYBFou2U2D7bA57v9L3/nnDWulJI0blZrq0DAbY7xlK0hijctCoYac9H5y+731Pdm+T
	grzHfQPa5GX3mgqY7IcnOfa3aSrfYsMcE2R0zqBQkuYCMziuAgXwD7NAMPjINnYPvkEb3fFG3n6
	ueXlNa7q6O4Lb3JAPfdQq/Js1NFlN7CdHm3t2vxldIHPmZJCbhtGGAQuG8++fbMuN4lQQ2k7R6w
	r2G4ppo3SAmapaAVS7dMt3r+MnnLp63X9yjqdzWWXQ7lXNbwX0xOWFIib2cv9/UbzqrKv6Z27Cn
	ePbDI/ZejHutW5qpHKfTSLkO3R0MsSgwTabG/KMnu0i+OlSUXRIom/i21VptXYDnJisHz5W4LP9
	LBLaINVmsz/v6F78UA8GyLBsy9mki/t/1oMIQRwpXIfnUUVx0diND2gWtZpUXW7LMv809wubs
X-Received: by 2002:a17:90b:5346:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3ac86a05c0amr2801047a91.63.1792048524337;
        Thu, 15 Oct 2026 00:15:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3ac86a05c0amr2801028a91.63.1792048523781;
        Thu, 15 Oct 2026 00:15:23 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:23 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 1/4] arm64: dts: qcom: kodiak: Make the ADSP remote heap no-map
Date: Thu, 15 Oct 2026 15:15:08 +0800
Message-Id: <20261015071511.977-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad07d8f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lhXw38L0c4fPFhUHQqIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXx0D9fmOt8Lds
 wD2OAtddYvaM29awi530ARYX0Hk4N6390pflj/XIC6/l5WZzEbZ5527plcMSnV6VyXUm+ITgQJp
 5CP5+MzVOOfphrMAK+hZgm7A2+782ME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX7+Ee1Sjbq5J+
 9f5zmWPZ8KSCuKiflvp/ftofPThfjR6X4/dJthGAaLwo2ReeDrucdjqtKNwLl2Un5M3awf0aVr8
 I7yn0+H4CXeHvj0JFFJZRuKaalxDhHPpMSGtc+uzHeWGnfL8FePketIwkd/SyVLp0Pvc8yFVhjl
 CE222WsujEAuGdJgvb/0iilDzdXf/26QMN8SuRA9EB5aLSH9h/vx0rGt/CjKLtEC2wV3tsWegKP
 8e35xs/UYpTp++oNYmMCWm3bNTsbyjQ0R/Cb2PvlKAfHyksOWQChKyB/ALTq/B8deVIkMbJyHNb
 xzNva3xYsi/6vAoVOPWyfX8KnRDZEWCr3dDlGs603QhRIhRipyC3MnaOkCmyj6XiQOTd3g/hHIe
 CXO4Jdgm/q0Jh7+s3vQAHyB1zJcPawYPCmAz30s6MHb3BV6Q0j9jXnXyjOrqJQDGf/6XKCG98QE
 3eO76zurMHkJUDJ8Hbw==
X-Proofpoint-ORIG-GUID: 2zQD8d_5qyFUUqLPNWMj78DfMrJG3Ikl
X-Proofpoint-GUID: 2zQD8d_5qyFUUqLPNWMj78DfMrJG3Ikl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

The ADSP remote heap is declared as a reusable CMA pool. FastRPC
assigns the entire region to the DSP through qcom_scm_assign_mem()
during probe without allocating the pages from CMA. Consequently,
the pages remain available for movable HLOS allocations even after
HLOS access to the region has been revoked.

On Kodiak, a synchronous external abort was reported during storage
testing when the kernel accessed memory within the ADSP remote heap.
The faulting address was outside the HLOS stage-2 mapping.

Replace reusable with no-map to prevent the region from being reused
for normal kernel allocations and exclude it from the kernel's
standard memory mapping.

Fixes: 9d7d847ff1c50 ("arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap")
Link: https://lore.kernel.org/all/20260423063502.484-1-jianping.li@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..057d7e62b2dd 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -194,7 +194,7 @@ rmtfs_mem: rmtfs@9c900000 {
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0


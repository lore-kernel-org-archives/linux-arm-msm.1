Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512D513550
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058164; cv=none; b=kIXWdSw4LRki+J4vyYNBaqh8NACwx93yn+3KvK7ET0yMHhDhWJ0PkOARmn8raltqkPrPaKreEnqiIHTDtxFdYlNH6Ueqlb1iGg9lPPwIk4JwS2kICpTyPBAfVbwiQTn/y0gTGKtmsd/12SLPqbh3Pp7YEKSC02NC+ANjh13Jtu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058164; c=relaxed/simple;
	bh=B+xQa6aWfmJa8pgwrofKzJvK3PURgsj7wVoF8yt4ddg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZi9cMV/retSrQhJxIE7wtq434/7e39cIbTJEUIWzVJyKhwcgZLIoSAOAuBQD/edmI103kZPOKi40d2jcm0ykoi5emzMqJYKumLCmif1xMfKwgwxZJhPTKdHE0cVI+mSkkvNO1nemiURFAGjJ7v9TqGcSWQxi+YVxk5qbEPdL9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aen46/Kr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SU3uSjUT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aen46/Kr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SU3uSjUT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jaVB2966458
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=; b=Aen46/Krbej98b8C
	LesDKNiB6nAn2RhbQZHG+DByVuGiiMKPTZeOhTiQCVQFT8fg4iCPBJKorqj7IWeL
	ZehWBsfpeUQz6zjqqKglJAlsioG+jREQUB07npAiHS+vi8ZKQ6I+E4NnE2tEAlJf
	TtAJIAs3AvtgwgLfa25T4cwdP9Dm6fhkNNUXEFrq1WRhVxWbMbEdfwhXdb6C01M4
	4Umqy9d9rQ/r5Mx9t00r5x6o4LvABuv7hBLjRi8hFpCdz1GrLf3CLzkSHAkTaeYZ
	aQR/j5/+tSWZccep93mxiV5jdIcKWCyVrraDb/C/BTPLEkH2MRA3Fn8kyGU04PR8
	tqYXgg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wue2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:47 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-156b5338d4bso1824266c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058146; x=1792662946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=;
        b=SU3uSjUTOvK20ZViBgxdOB1gNmzVsjSt3CFD56hfi4B4cAqmuYsx8lhpwwR8NgjxoS
         +flp62cQwJHNQcilmiSSUUoOdL84ws5t4+z/Pd/J+tckRjQHOwlA9TypxK6s/tRMmGxD
         FW7Yj+VvnJqFZhr0FVisiUXeg9ht1/4NB/OTZGlZi/GE6voJQ+0RymV2v4SyOswt3brV
         vLanNKf/mPCcdkuV0QXKEx3sX3NnhwY4qzp8xcuynqhKvTHdEXQVdCW77GskpNYVOOZ3
         Yf2TE1bgyKo6C7ePbQjl84PxrtJb+N79zWxYuXcwvaV/DKKo9NdJtnnUgxgwxNnX7JY3
         nflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058146; x=1792662946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=;
        b=p6GVCys2C/WyYKPO4nOpMX8ekSXA9j7dbB7GIxwHk5iuL6wLWekJQvPH2dUaugHO8k
         8wExiEfJKrNjbJBbz5ef2hK9uzmkl2MKT9AcKsIW5wOP4Oo0iTvxslpFaHiscZGnWs/3
         Iaacj+vraLp5nybxZH7lD2UiZSOxxlmqa/0ysGN0lgi2bU6Z1mfPRiJBDn3dHHIdfsAT
         6hIfJkQkLyoAW6in2gPrzhgAAjkNgQ19XH7NY8W1yMUAFXQ/ILY6fqGfwX0f3zsTEJva
         WZSepuPIXsO4DvkGW9hVVlaMENJTXHB3+uYnlIl02DCEa5Ru6A01D6W3CAdklWJy0Yu3
         V74Q==
X-Gm-Message-State: AFq9FYIGDUepSs+m57dJXfIuJwwQiYZcs63gIrw2l7QPFThYrZoqJ4Hm
	VdQNTjBqka1xTUqm9orRASZ+EjdnFF/Y1oK51fG2AQExu7YaShmJKukZf/dRf7wAmhTF4SBy7QH
	XKH7MuCi5MwTB55iskKB4okSYY+9pMOn5XiY8L4OBhGnPizq8r8w0YqP7bKvud2gzgv/H
X-Gm-Gg: AYBFou1su/EelaQqOUredoKD6+sDSrqsbznLh7Kr9cawBVOmTr/I2lXkPQMFsjgeEPO
	5OxrMe6oZDGCD7MjtvDpqpRtj+dnyZYDs5UCn/vhaN69xMIO2kvTKuXnQpSFvYrtHSkN82fjWeF
	PdUx1HDaoH7TvPQZLl/VTKsq4iuyib6+cPjNhyt76YE6LrUjLW/gPVEU+pqQTeU+g319OXE/Jfg
	Zkr217KqP1kP2eEm4wugErAiTELYCrwxnLb47nkVQr47TIgj7G/omQ0ebnIXpUzuHSsMpJ7XR64
	yiB7L7m5L2CyP0hyFR8w8kJUuGQ0l5TQ7E9j20l95PYedjaj+QE88AAU5pDAi4Gigj7J5Ors4+P
	bRGN1i8SUb9sGul+vy0arpO6xibf7
X-Received: by 2002:a05:701b:2710:b0:144:e246:a0b2 with SMTP id a92af1059eb24-16a6203df08mr28902772c88.44.1792058146140;
        Thu, 15 Oct 2026 02:55:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2710:b0:144:e246:a0b2 with SMTP id a92af1059eb24-16a6203df08mr28902738c88.44.1792058145567;
        Thu, 15 Oct 2026 02:55:45 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:45 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:19 +0530
Subject: [PATCH v2 3/9] arm64: delay: Move USECS_TO_CYCLES() to generic
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-3-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=2581;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=B+xQa6aWfmJa8pgwrofKzJvK3PURgsj7wVoF8yt4ddg=;
 b=8Qsz/wTwPE8obmSszofPzNsTV3AW55FSO0pTbnSQ8pL9/PopWeZZUe3RYhaBB1KpOzqbR+2wf
 Wv2lcWzDyyFCGsPOWNA6LQvNsuv8/3dekFfOSjD6FM7QFxHqs7+fJJV
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX8lP38XQ63WJW
 aedpYGUZIM1tcH01yYVA0n2ssADuE9PQr4mDxf52d0joJhGBAupj7h+lXrvNFZkqsiKFh6rsfzo
 BZ/28a1gTVP7rjgBstcLpaLOLmOnAXc=
X-Proofpoint-ORIG-GUID: 0FdS5Aaf8w9mXE6kfYvtiMly91NybpxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXymyOZ7V6wgxr
 Xz29u8GccPf3YQkRWwt7lcOsU1U1bFiHqCrSAzDF3CuCk4vcAV9NN6Xy8/aPTEBUxXlgMmmD2km
 IXE6Rxnf/T0fGJ7PKTXDUE6LJa4p9Nc0DBK/K6MajrYruvg/9f//P8drjeoUmonANYXRjAxryqY
 2dMjtLIB0HAg53d0UiYWTn1ahgBlZKTfWtjaOzRwIEZ73Y1VRCu5CZYDxVBuie8ZbGD8DmZr1l9
 4rVXJqcrKNsnrpHmcxTWU05lBJSuPYQ9hPyLY9v89lB3xHtbjerUD6C2O1uLbwyK6gFhCO536uB
 aF48w/QydSw4PX9F5bq/QYZz0JuB5FaqZsybuwFmLdepWbTwj/iz01TgAdaZmr1wdz/iNI3YYac
 fCeUOVM1JvfPNzQJD6WncUT/vaoFvtCB2TqXZYkkayUDavQNx3jAze/fugqGdGK0LFhY3Q1P6pi
 VWteqM4X7rtsnBJphoA==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0a323 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5RFle6wAAL-XeIEoYeUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 0FdS5Aaf8w9mXE6kfYvtiMly91NybpxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

USECS_TO_CYCLES() converts a microsecond delay to arch timer cycles.
rpmh-rsc carries a private copy of it and of its xloops_to_cycles()
helper, and the MPM irqchip now needs the same conversion.

Move both to linux/delay.h and drop the rpmh-rsc copy, so there is one
definition for drivers to use.

No functional change.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/lib/delay.c      | 8 --------
 drivers/soc/qcom/rpmh-rsc.c | 8 --------
 include/linux/delay.h       | 8 ++++++++
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a9ec3953657a6bc8c0de0da4399fc..117ac5a2f13df1935dbcbc7bf32901f7a4411295 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -15,14 +15,6 @@
 
 #include <clocksource/arm_arch_timer.h>
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(unsigned long xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 /*
  * Force the use of CNTVCT_EL0 in order to have the same base as WFxT.
  * This avoids some annoying issues when CNTVOFF_EL2 is not reset 0 on a
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c493d9e06c048930b8a14a38660df4b1..4a664d522142747427de5589f8aa90b3e3b74bd9 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -146,14 +146,6 @@ enum {
  *  +---------------------------------------------------+
  */
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(u64 xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 static u32 rpmh_rsc_reg_offset_ver_2_7[] = {
 	[RSC_DRV_TCS_OFFSET]		= 672,
 	[RSC_DRV_CMD_OFFSET]		= 20,
diff --git a/include/linux/delay.h b/include/linux/delay.h
index 68b2a69dd24d6c135f9f749c1e2f15f8b3bdb141..31e1a3dfe2dfc1a9dea7fd6d7db735f9a2507474 100644
--- a/include/linux/delay.h
+++ b/include/linux/delay.h
@@ -17,6 +17,14 @@ extern unsigned long loops_per_jiffy;
 
 #include <asm/delay.h>
 
+#define USECS_TO_CYCLES(time_usecs)			\
+	xloops_to_cycles((time_usecs) * 0x10C7UL)
+
+static inline unsigned long xloops_to_cycles(unsigned long xloops)
+{
+	return (xloops * loops_per_jiffy * HZ) >> 32;
+}
+
 /*
  * Using udelay() for intervals greater than a few milliseconds can
  * risk overflow for high loops_per_jiffy (high bogomips) machines. The

-- 
2.34.1


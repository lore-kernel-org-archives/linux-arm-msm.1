Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171064C8C49
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559762; cv=none; b=b9DvmTqkZ4Wh/HaH4kkzXV2PjQQM57SplBqgiVsWQCAONmj08QBAL3/KRZEMKRPoqCR/9lBq/7gqu9YoIlyhd7eW7NfbVgeVPR7/oqsHwP7lBh2jzDslq1rsEFGxFFCZNcZ2/cl6AXO1Uxip7SlcqzzE8dTNpxSKr9wCgqwySrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559762; c=relaxed/simple;
	bh=r5edjYHWcbLbf1p3IWihy7C7waQQXQNiUeI2eHMHB/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fLsmmHV8O102PJTkSCgHCcdy8pQKAlwMbviqo9ruWMxwf2HzIIaG/hjyXSWFonhzw2HB9j+lNwXblt+8pQwkNTDTMV18dnYsEdljJGst+/v7jWSrEhjacnC+vsMoME8or2ppmX0PAUkqmM3Lr8mdZEpti3sEkxnvCAHcCXwOfL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nn3VDP0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsrpaWnx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nn3VDP0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fsrpaWnx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GBkdAu1912230
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ee0FcggQC8Fx6LCyjG2aS
	hjOOnSgooLHQ16SsvJMiU=; b=nn3VDP0YUDbQ9kat3MvT1E2iSx6rfD2Jfh1bGV
	0cZ4FFmL5uiOvGc5evtNw/elXzCYS+i6gDJW4HQUoHEnf/rp4hSOvSPQmEUxODru
	4PS1VWxHZjfd5OzNM4Fg7XdoIHJp9ODtIOcjINgB5rjEXFehtfJBeTpzV6J2cvwJ
	bRs7F9OLS2LSSwhV3WzMip4AXFub9w8BzoTuJZz8xMCo1buJ/nuYI5goUd+krbL1
	DrGM4tX7xwXrNOqYXW7duR64hN3gYCM5zFZGc934KY/bvi/51Bv78CxZchqyDaa5
	ECQBvdlv9ubZ3V2JeVflZRYQHYPiEaTDiHawHt9wRgtgROtg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnr200-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:55:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so379538785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789559752; x=1790164552; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ee0FcggQC8Fx6LCyjG2aShjOOnSgooLHQ16SsvJMiU=;
        b=fsrpaWnxVW3dHM0BKVY5WVKYhrkTY/S9CQUignERWLIeIEZkwxRgXS3vQq6hwdv0xi
         LWaEMSzeXbaVd+8zIpDeef2jObNPGMuB87OGaIk86lOS2/KGNsFTWhE182Ws+egGDvr9
         dIPxR41Rne+9MKgeD6eOZOsQm5eWYVRor647MN4ZVZ10swB5WKja+9BgNlBrcoZoYXTC
         IGBrffI4EHyTAes/cRGe1svAhK2HdQBQZKAgWNaktJYgHeWC+U8PmWF48pwTSueRT3KG
         lgUAGbiI2ebB6ck/EwGPSQDgz0riLk88ghkmwvfltM9MNrnXQaSaP32F/bvBk0fS9dua
         zg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559752; x=1790164552;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6ee0FcggQC8Fx6LCyjG2aShjOOnSgooLHQ16SsvJMiU=;
        b=C1xDNKaUJ+Ige3zbmZjaAtbHaRjPalQNZBsV8WdS9VZxm/UIP3+R5MTvB6EFTjkRMD
         KrM+KoUTyw2i+0+oEC0a3iQZhLXTt5+owHTNsbvPqWx8TWUnQkg8sY0XfpC8chgRpop6
         xoVdzzDX8lPUCdpX2voQcEY2VWw1gwUmitCuhfx1d+j983EnV5Y425ofDkT+vKPY14BN
         iqBSptbMO7UwfnMFPsy9MPpqnzutQAmigQnDHZkBTkqrm/OGGNwD8PtuKjJelbIddwIK
         iEDJy0nL1GxRwrZ9qSLZzVsgAFHQBjyOtZIzIdfXOqTMswxzcWji+/IB3tcKDQFkmmB4
         xVLg==
X-Gm-Message-State: AFuF++mX+HegKFJHwHZ7RYoMCtKzIXDvwUAgl7xLZBMcwrNGG3X9lRr3
	HyDA4DKlcPJz1RqVKnF69q5evJEQBxz/aFEVMFFbaQr+iTt/8vfLXgLXTeCNYvIrsuG6qP6hkh0
	K/vn2KPncszC2ig4smEo7rVSiTzPfPJEGr2yq4FPwxY4flmRxRIdDP9zoZxpJOCZlAgci
X-Gm-Gg: AYBFou0gIbuewikMy34N5v3UXQd4ZZoeqCb0g7XhXKjqZAk80hZomkTy97xRQdumQ6F
	vlT6UQvzek4i3Znj0kBHllzfMt4aXjZ/5CY9M8OuwKJtO0yn4OLXBtSN7rf0mVL0tJ+A0SEhVbJ
	zPdyHEwjsLnXnWQGC+hVPG0DvKPzfkSiEm+exQsAZiq+dzEw4WLEeIm2Ur4hkSGFJ6/Y7e7VT0G
	xFi3K5eCvq/jIfhNvEKEKPHovcpmfbBGAHA2VVMhyxjgdNfyGlin5OGlqcG4mYT9zWrZ6VuHWNL
	ja8MLN7HsKec/ZQnUgM3QjC4J99hcPbccf8b8QV1jQ9Ae5jh4zLCidtf2nXgJFMIVnTQ3GVtxta
	TSxmxaTpP
X-Received: by 2002:a05:620a:3710:b0:939:a8b1:3696 with SMTP id af79cd13be357-93a346faf19mr1043575585a.27.1789559752080;
        Wed, 16 Sep 2026 04:55:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:939:a8b1:3696 with SMTP id af79cd13be357-93a346faf19mr1043571685a.27.1789559751528;
        Wed, 16 Sep 2026 04:55:51 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf33e01sm7819977f8f.23.2026.09.16.04.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:55:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:55:46 +0300
Subject: [PATCH] clk: qcom: mmcc-sdm660: Fix MDSS AHB clock HWCG register
 offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-v1-1-30dcf09d907c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMGDqmoC/yXNQQrCMBCF4auUWTuQBhqIVxEXzWTSRE2jmVaF0
 rsbdfnB4/0bCNfEAsdug8rPJKnMDf2hA4rjPDEm3wxaaaNsb5BuV3xQyZgzEYrPxigM6Y3Zi+A
 YHcYXTVhCEF7QKGWDtuQGO0D7vFdu21/vdP5bVndhWr4R2PcPpeHtoZEAAAA=
X-Change-ID: 20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-6009f29cb595
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=r5edjYHWcbLbf1p3IWihy7C7waQQXQNiUeI2eHMHB/g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqoPEGDm5jrYhGCoYDA1YlLSBdj7bNyZ2o9uzb
 IvgGX80hb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqqDxAAKCRAbX0TJAJUV
 Vgf1D/oCaOMbGaJ1l9+agMauw/7gcumX2bkasnjBAJOnUnKQDeOWwuxxr+VRSmvqjZ8eLcBE4gL
 s85KhopcOqQkzkp7sgqkk15ZKZWCad7bcNHtuFrsUWTJTNx3D+MuUQ4uqLlwPpWpe+Ly6DY8V1S
 qDHuYixv2ZPXNJIjO8gliO0Ox4FLxWWmylM9KbSbIDXkFW/wvOkONb4q/tFHN1LEybeyCl8HNvy
 MIyNW4yK/RsN53SidXiZpIJFhboGiwqycHWX6dwJOA26QpVxeou2YsHhVTLMaiU+73TzbUVsF4X
 R0dB9GuyFiZVrdJyzL831adeg0b6NoPqfb1cqIFM8MHQvJO8jpcvNgew3v+o+pHG3o2CSaHJQ/w
 zsBQcAa0fqCkVVs/ac0Kd8utUKQvyqIedPCTarWlcpQhTFqer4ai409LlC2fH/yqMkHNeW7rx6T
 6L/+2Fu0TpaH3+B5+EXgK/JUk2yybol0EBUH4JXO0eT2VbrY8gtDQ1jPd6aTWDtmT4FmzqMBtcp
 GkqiVQWj7p4m1FKSZzyEB7IUqobmebRZqmU3UNSizdqdHTDS2v3zpV22ADtq+nnN0FHF5z6U48E
 zpMLuafC/kCOCFPIb8e8/rsTgvYfgbYnjXx52rqks0muidno69I/y2ggWUFAtL4xaUVYTxZ1qkL
 R7Nd7JD8iQdy/Cw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: muf-j9hwgglbdE37eicbtZT6HJXvxsRA
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaa83c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FrX4wj76YW4h5ywvKWkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1NyBTYWx0ZWRfXzpc67R9mi/kh
 JNq6unDUqq1EbuHgAGl7QzrM9xG4lliVDD2IcDspXnR4U1fBi6veKl0o0WVxmiPFdPBL2C8oQM3
 6L8tgv7CnSVVcbtAtT53boHhi7MCJNvhNhd4/gk8ChUvHUFlMYbD53IHhf8nXY0NtRTfC/UteWG
 kEfRfoMrAfP6TWQaKTxWcXdBR8Aou6Ppv1lxuHqgTzMmFIcR2FVu6/eMUTDflSAoJt4Jnxb5Hjz
 kexhIvRhaF7ya1J8+kHSWRiXagxjj8GE4TXbCnQ+cq5wjroz7IVozgYzH5oo9w+QDa4PJvSRcB9
 hsiewbcbbqS3YB+DKu5/8wWr+hfcErtqxyQ10TW3yENUYQ9z2n+c+TiFgXTpk2tRqYwkYZ0j8ke
 lQsKZ18vHWq3Z3+ILxaURrOhY27/+6fLgU6PTu7P+qgxHwNy6MBYwVbB4eyh0e9UPovgh9mfpu7
 G9JMcOMGKE2d9B5lTaw==
X-Proofpoint-GUID: muf-j9hwgglbdE37eicbtZT6HJXvxsRA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1NyBTYWx0ZWRfX8KD5i3/tBpW6
 KhUV9HzZ4MUjeRubCJri7KJ/URBJkuPvxxrMACfQJmY7C+WX+RahLX8LgF5Tn6rGDh/ZuY6AKHr
 msmACeMMq/2OtQIMaF50difjrESkgC8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160157

The MDSS AHB clock HWCG bit resides in the same register as the branch
enable and halt status bits, at offset 0x2308. The current HWCG register
offset of 0x8a004 exceeds the regmap maximum of 0x40000, so regmap rejects
the read in clk_branch_in_hwcg_mode(). Since the read error is ignored,
the helper uses an uninitialized value to decide whether to skip the
halt status check.

Correct the HWCG register offset so the helper reads the actual hardware
clock gating state.

Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-sdm660.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 200f986de965..9f8b8e29fa0f 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -2017,7 +2017,7 @@ static struct clk_branch csiphy_ahb2crif_clk = {
 static struct clk_branch mdss_ahb_clk = {
 	.halt_reg = 0x2308,
 	.halt_check = BRANCH_HALT,
-	.hwcg_reg = 0x8a004,
+	.hwcg_reg = 0x2308,
 	.hwcg_bit = 1,
 	.clkr = {
 		.enable_reg = 0x2308,

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-6009f29cb595

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


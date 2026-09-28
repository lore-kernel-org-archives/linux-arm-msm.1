Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F74D5964
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603935; cv=none; b=m5GPTOUZS5rEjCwMEmhx7KdwXSbnkTuYRLJFoF9vIZwWOZ/I5AnQKaj+hnFCBaZpSnB0t+91NvfB3eJeNVw0kpGDoNVkpw8fxGMwG4sIMvBAgCCcuz4/U+JSQNPT/om2QAuN2ta5Tk7TKlKnCLm0JE5L31K1wg4rt2+S9HfLRvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603935; c=relaxed/simple;
	bh=PF3mavYaPoHM2DnA6HWn8PbJE+zE+ePri8qiaI9pNos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dMC6h6thtf3DKGt6ugJlAJY/cwbdya5RZpgwrJwnLeYE/L/CAgNjrW+18LRExiw2/8nnN02lD8V2NFgGOGUB0UZ/cUNTq1hWc+wTNK7FaKJs9HJBCuYg1E2yo+++HBVr0VQVP8uUjG7iGnweyxyPuFfmavzHo0L+cv43G/+f+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfGyvXgr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sdb1CjU+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfGyvXgr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sdb1CjU+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAHT11189565
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 13:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z06y7vw3at13s4cRuIE7bF
	xVaIzhYEpTl8wKi1jEi1c=; b=IfGyvXgrKkKC2iXaoTRP7Bgp7rFTPgoV3zbRyi
	Udr5SUkb/v0gQOn5CKOVPHv68upjQvb/EwKBFedEBySHa9+3sRaLcbXzvUMu5+Dc
	g74yUzThtVH1ClthWZBqq4+wqanF2OwqIC7jhpR4ER+XFu7VM9dTWdwFsCp8uwC4
	BPcrviPzD0GY8g+OZo2jDE4PKD2bPiA+TKY9aWc+uUsO4JZ+uBHxhEU6Wl2XWp54
	eARpvxY31VP+l0VLDHWL3R42Qg/Hn3Y6H9ONyezl049UXqMbVHj9FidlMZUd8oCW
	WFi9/bTA1qniaYKaLgIi5qYC1pg26RVTHLQ/lZEF/jzqM0bw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc10k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 13:58:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-915e6c351f3so18376056d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790603932; x=1791208732; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z06y7vw3at13s4cRuIE7bFxVaIzhYEpTl8wKi1jEi1c=;
        b=Sdb1CjU+2150aZV96jUv4bwNY8fyz/ZhEkRwz0qjmX6MucMayq1orveNA9XKzIO+Pb
         xkLIHZ9Z3s7H+vyaoEXEowvIt5hM+2p36VvZdBVRfrBtg0gA7/taCAri3sp0LVxUPBuL
         W+2ha0160sjGgsHPJL308OXSv9i+JX0W2bZgEcbQjo3TT9RWU3locsfiBV2oYLLwjTfD
         Atr0O75maLsrqXxXAVwhaqJujfMlHIy+tuNH2FK2qkGeg2Dd0e6jSWUK/X73wr/ZYpoJ
         vN3n/3IMXPfIgX7xDMAYlc8s6FvvLuEp1D8/W0qelfQMwdEiRqNlVBDdq34sjyxTQ6NU
         hv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603932; x=1791208732;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z06y7vw3at13s4cRuIE7bFxVaIzhYEpTl8wKi1jEi1c=;
        b=Pz/AtalZMhWTq7uW1EhBTLbhaJVwCNZ+3PJY6Quk5q0zQnnkZcFAxz2K/ED2q85hOo
         tJveqzX4jVC6T3D8jLNUllbxkCxKczGjiR3nFUyUwv6MrPWzTNi9zgNcB03KZdKoAN1v
         HF8K28raXd2nFGViyCg0MdV3Y/pQVt7aeF2K8wT+bgfeT0Wu8WjxgsIqo0BJW05gGsST
         3w8ScxW1dzcRz196T1aMNWILpxRKmk+PmgFPC1X6FOz35CiyvAzWXyxjfSuOtTtBzZ6o
         hPg9jF+s0bA3s1jAyN0WE1CjuIlCNiOJXFm/lcqWF4vhw/UhRtbZCP7GUOo6nlOr+Wfb
         OIMw==
X-Gm-Message-State: AFuF++nO3896meUgpugyHjZwT07a8aYJP9cqtYR7KDzREDe9mdsnc7Xf
	VAHdS6M2NqaUARHd0m7dQQrCxD3qJz9GfxoLevC8OWrkhEDZ/og8eGTfilyPdJz72CtM/jMHZmk
	f+XdctXwlHL7412217pGY/WzCi7XQAEfSGuLrR565VuevuwrOC1Y3lmmB7p63AJC+HrEb
X-Gm-Gg: AYBFou1Mn0eCLjGU26TOR2A5qEqQLvWqTC5zDi565Z7wfnkE0xENO1QeFQPM9R5H0JU
	y2D6ile1Fr5tYK/DqWMi2hOO2j/knUxkEFV+HzQJsGsCdTt2CJmYAYogC49WW5jdrmzWMvz/br3
	Ib9JhHHdmTfBLbWXN9YvqN/53/pt0Z6e161jqyqfWo6c/sqw6ILHurzVoP0keKsJoEpIJ2j6H8X
	45Jen20Qum67fb2iMnhwxiJQog4eeeeZiaShCxfMtNm6AHuP4IUzVbAR6VcHq2m2n4UzVzg2y36
	Gexl1feBuOqdThwUccOKAAGIV8t31cL+FR4zp7Y4zTuRhIWs4eclyvPFeu+xsFsWwciV6yKZu9N
	c9XdTxYgI
X-Received: by 2002:a05:620a:2801:b0:93b:f6fe:e29d with SMTP id af79cd13be357-93c43b7e8cdmr2144868185a.2.1790603932034;
        Mon, 28 Sep 2026 06:58:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2801:b0:93b:f6fe:e29d with SMTP id af79cd13be357-93c43b7e8cdmr2144863585a.2.1790603931308;
        Mon, 28 Sep 2026 06:58:51 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c10c656sm9042365e9.2.2026.09.28.06.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:58:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:58:47 +0300
Subject: [PATCH] i2c: qcom-geni: Restore the source-clock selection policy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-i2c-qcom-geni-preserve-source-clock-v1-1-9aded7552a76@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJZyumoC/yXNywrCQAyF4VcpWRuoo2jqq4iLTprWeJnRiS1C6
 bsbdfnB4T8zmBQVg0M1Q5FJTXNyrFcV8LlNg6B2bgh12NVNIIxb1MD45HzHQZLio4g3JkHLY2F
 BvmW+YtfQpo9xT0QteMxXvb5/R8fT3zbGi/DrW4dl+QBEBXMbigAAAA==
X-Change-ID: 20260928-b4-i2c-qcom-geni-preserve-source-clock-d983fbb7888a
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3551;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PF3mavYaPoHM2DnA6HWn8PbJE+zE+ePri8qiaI9pNos=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqunKYaDaqeCWuCxT2oeHAWvw9Wx9SSZQSCBzWW
 R49wx7fsOyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarpymAAKCRAbX0TJAJUV
 VuPtEADJrMrMUubr/keadVkmrAQ5vUb9XBPg4+Quv25h61S26Nh6cKnfQq48CadLMA4sq2w9J1N
 0G/jGh0ft8ZiRcw+sXpFybbjeiYL5eHTZ5NwGmedTbegJyZc8tldD9gcZFKp3TNuOKTyFG2QknY
 nGqWKzutetmiMdAsmtUTCnjjItr6gaDyrWriTDdkxRAs744UHsygyu7NDFo2TT4uYIjBosy6wg5
 xEHm/HEuH91955UfjNjLVGaAHk4jdgfFs/+heeGDOl5eMpAkCYfZC2PtcZabWCDNmOkQIjATvnC
 yce6pa56QC51kEjUC2Li4Idt4rQspIDQqDmtjzxgjYIluz/M7p+jO8gxUxgeJJKTOINuseDPL2f
 fbIYtQiKC2WuQjctW0WBWzAzyFGK1ynLHga+efJiZiMOaSEnh0m4zNss3YG6EudrGquETa7D4zh
 8mlm4wZUTAdnWENxVS2CFlfAflsm+F7YaPJ5KuWpLUZkghdAoGRafI/7TrZf+Z9tV1zNGHPhd3z
 SHnZ7qpN5ELItiHeb7PTJzC/ZsHa0hkWAmhCstJxqkOBcQqsPSLCbcjEqsEOs5NHLxgqJaCBKFQ
 uQv4Wf3odqWASqhCcvcyv/AZoIIv2c8em37dVB9PUE7fDjqxWKxFpkvlpjSljnNps7HEwisZU4M
 O7Q/Hk0OnwDO/gA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba729d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gKQ3Efz66tS15YKEI0MA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: lJJF6RI04iCn219oNBPpl0g7IP-WO8bO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfXyZYb/EgvsfQM
 py0eQ3ayCKRTTj01qo8eZ24AWHQeGKN/Uytj3xq2CU+YaBSixnfs7mYASzAcbpACdYrIDSq6i6d
 BEBzanixc4EcVM8SEGORH2jbkwXtfzd35PsiFfVvCW8aMjIKfZS1qP9ZTRrzBVFQ8nQSXOvkUsb
 S6WZLADwk3WzpsMblsb8WVJMKKsD8/7e3dbsp0FTe0RssPaScUG754/PetqvZ8yU8VC97/61ug0
 n4BbCs/SbQ9aQhqBOryzT9UCU6kQNXMIo9n3zfRiAq97I3MUcnsqflIDfuPrNEB6XO/AZbrKzEn
 Shwtzog8eWXt3t5FGXXS89QK3iJkZSPbqKv9gj3W7U9mOFXimbqCkQKMNuVCNOF9I09TZrCmK4x
 TwkKDj/U9Bx/a/up0vnAz6tcWIgKzlwAT+7FjDRaqYlYWPoFtiwvvp0mlI5x+0LEu6Zdh0XlMz8
 wjj0nq4urHb1cmhLZvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX4BLQ2yKupraB
 lrpMZMkC0DqCUVH++TpcDTjBRVEWT+ghf8v3bpQmStZXzex3aeADFFeIF+0OVQj4hDmgsRM+HBw
 pm7l2PRMMdynVZjeXKNJ6Fbr6XGWd/s=
X-Proofpoint-ORIG-GUID: lJJF6RI04iCn219oNBPpl0g7IP-WO8bO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280055

Currently, the source clock lookup prefers 32 MHz whenever that rate is
available, regardless of the rate configured by the platform. Before the
switch to looking up the clock index, the driver used the 32 MHz timing
table only if the current source clock rate was 32 MHz, and the 19.2 MHz
table otherwise.

On X1E80100 CRD, this results in switching the source clock from 19.2 MHz
to 32 MHz, which causes intermittent failures when probing the I2C HID
keyboard. These range from corrupted HID descriptors to failed resets
and transfer timeouts, which also affect the touchpad on the same bus.

Restore the original selection policy: use 32 MHz if already selected,
otherwise request 19.2 MHz. Look up the index for the selected rate and
keep the check that rejects higher-frequency multiples. This retains
the dynamic clock index lookup without preferring 32 MHz on platforms
that previously used 19.2 MHz. Report the requested rate if the lookup
fails.

Fixes: cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index f842e7ec56bd..9273d84d2f34 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -206,28 +206,31 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	const struct geni_i2c_clk_fld *itr;
-	unsigned long res_freq;
+	unsigned long req_freq, res_freq;
+	int ret;
 
 	/*
-	 * Frequency counter tables are calibrated for a specific source
-	 * clock frequency and are not valid for any multiple of it
-	 * (e.g. 64 MHz, 128 MHz).
-	 * Use exact=true and verify res_freq matches req_freq literally
-	 * to reject harmonics: a 64 MHz clock that divides evenly to
-	 * 32 MHz would pass exact matching but produce double the intended
-	 * I2C frequency with these counter values.
+	 * Use 32 MHz only if already selected, otherwise use 19.2 MHz.
+	 * Preferring 32 MHz merely because DFS supports it breaks I2C
+	 * transfers on X1E80100 CRD.
 	 */
-	if (!geni_se_clk_freq_match(&gi2c->se, GENI_SE_CLK_32MHZ,
-				    &gi2c->clk_idx, &res_freq, true) &&
-	    res_freq == GENI_SE_CLK_32MHZ) {
+	if (clk_get_rate(gi2c->se.clk) == GENI_SE_CLK_32MHZ) {
+		req_freq = GENI_SE_CLK_32MHZ;
 		itr = geni_i2c_clk_map_32mhz;
-	} else if (!geni_se_clk_freq_match(&gi2c->se, GENI_SE_CLK_19P2MHZ,
-					   &gi2c->clk_idx, &res_freq, true) &&
-		   res_freq == GENI_SE_CLK_19P2MHZ) {
+	} else {
+		req_freq = GENI_SE_CLK_19P2MHZ;
 		itr = geni_i2c_clk_map_19p2mhz;
-	} else {
-		dev_err(gi2c->se.dev,
-			"Unsupported SE source clock: must be exactly 32 MHz or 19.2 MHz\n");
+	}
+
+	ret = geni_se_clk_freq_match(&gi2c->se, req_freq, &gi2c->clk_idx,
+				     &res_freq, true);
+	if (ret)
+		return dev_err_probe(gi2c->se.dev, ret,
+				     "Failed to find SE source clock %lu Hz\n",
+				     req_freq);
+	if (res_freq != req_freq) {
+		dev_err(gi2c->se.dev, "Unsupported SE source clock %lu Hz\n",
+			res_freq);
 		return -EINVAL;
 	}
 

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260928-b4-i2c-qcom-geni-preserve-source-clock-d983fbb7888a

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


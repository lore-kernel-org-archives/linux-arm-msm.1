Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A81411A1B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912995; cv=none; b=h7Hjf0fr0DcqOkbw1AzeV1HK5K/3VUP2eiaMskiUosOFoNywFmrAgix+qj6BFtBfjhZt+xDHpxpIQTtSQsGW5HLZ1b5b86Ci82giy7wcRRhOwsA1RZK8tCF7wdTG3UMGKhLuX0yOaU0+pL0ftWpPWnh/USInghpIqsVQYHL8JYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912995; c=relaxed/simple;
	bh=I7wMMzUOTxXy59XXrAAdXEH/cY4Bv2uQCN82eMYlt3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gDEA0M8lI8H5DgFJMTSGkN7MgJLKtEUxYst0EC2TD/WVP203gjDugiYg4avNGhsbIYGl9hMGqWwVkQ8I0LXxbzLKFsjkQu4gfNb0FmCLeJ7QFVkSouJW3to7w2dVbS4QvSU07JwoSR8QKVYw6oiDxQ/TMic+83ph6nJikjgvCT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Whj49Yq3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mcisa7MK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Whj49Yq3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mcisa7MK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA88I02596139
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6AZ4KHj4RIWnDS4nK6Js8M
	IOlqKDXq/pyeIEXZbRqBE=; b=Whj49Yq3jIAE0BX6cHJ4erISo00PeGlSUujgwT
	TX9KRNnOqmCB0qau0p/T9Kom2C4KeBiBy+A3ROCQel4jIq6lgUe4dL2oV2v7m2fz
	VARlgjHdRdwhCA4qfD2xckCUvQPEUCEqIof1XeNcgac+nsFrDzfYcXkRWx+hgzpu
	qpwAA4mMISg4MoFxHQFIDGfr2gcIR12DvGO29TgmtRZ4MLhwkjo4CTBLZBhz+DWp
	SE5gXfDdtl9T3lDmGHNIpOV38OYZQAMGvwJRuxN6V6PPEbgVt8ntRXevcPIVVSK7
	0QalaDhYRFRRCCFhn/QvWNlgug7J6hYEVKZBjKIn2bcCdOsg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v39reg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:29:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396638f9a18so1501061a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912988; x=1788517788; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6AZ4KHj4RIWnDS4nK6Js8MIOlqKDXq/pyeIEXZbRqBE=;
        b=Mcisa7MKcPRcDDah75mEcs7CeVEvx1EepdF6B15PAPYYvEqCVcEToHVEUwj83Cbex8
         HZoyLP7GaO61HEHFFNcYDe60i5E0VdrMOv1TeYMmqv+jCs0MTKJxKlBKM3eE80cw+m8p
         1iCFWCelL3Kl1TXBUATEfSaJco/4/kGJucThccUibmghFjc+s1RYXelKWzv3dXVj3H6/
         YVoHCaNtL1vgqzqZMMF1tBVA66NL9ctcZiY1kGwTDkxG3YVKdRO6f6bsh7UYLZpC1l6g
         eD45TZsT8DLAna7Xg+dPCze6IhPkZ97Ts28WMC5qoZwSnFs/s535au+NuexfkWTmf7gG
         71Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912988; x=1788517788;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6AZ4KHj4RIWnDS4nK6Js8MIOlqKDXq/pyeIEXZbRqBE=;
        b=id5l8Jfiz1yY+sUdAWMMuz2Ft32mpoeolGAIWW746YdL4c1CMOntJ5RfSyDD4qJG8S
         Hyz7Q3ToJxZAiRhljUgMND3Hh/hB0Ok5nGtxZ3rYf+SvtAU1bbWFRQZtI07sSpWtszTG
         LEMLynzHLorvqTCb4jvYhDO3UoeF1VcuSJtfJnEPCs93jj0M53wj/qGY8OIbJjonOIbp
         QMT3yHto5tuxK9Mq4Jssd/6VxAE1mDffTW4yXtGL5S4eJItDVweonN++sQpnjYVfTsAW
         bIRuYqN0wCQ2NC7WB1QcJ/sjwWH8GQTLHYubgTrauow7aV44WNL24nrhKdfHHJrgLOW3
         rYaA==
X-Forwarded-Encrypted: i=1; AHgh+RpEbbW5EZndzSEFUKPOMS5h8EqJIeLhOSd+JxUmoPxnVFmbWZvDE1ezgllurfmPPk0xUfkgmYdsZ3xGx3Is@vger.kernel.org
X-Gm-Message-State: AFuF++k0FTmYvjdZEupma5+8zlD41rxuHTO8yB46Qijsv9mvIXTCtPJn
	1NWAeyg3qRHjYZtswLkL/9s1RJ5YscF5+Axq/Nz5n9bxwWKFdt7zkoTkCKzna0zw8uBqi6X5Dxp
	mIKkfcKLjaFQgdNe6XJQ/BlaEBcP8x4SlChpp4MmpSvlYeIpIzrUBGeLPV1CT9PKPE8I6
X-Gm-Gg: AR+sD11awBVOE/1p8A8dd4K9qIj+heDho1Wk6P3RjByXz2hLtkiR/PTrctBGNuD2bcB
	gYEl+Gxnq8Jo6pfgtbKJes3AqXArgRKb7ypKLQ1K9YGtbBeONE+TiwJx8noj38jqi+W8D16hIrg
	r/z3kOOB/2GZ/6SF5buXzbE5aM/UtHUc/bZ9yfUrPSPLRHWZd0COu3n/AwT94am82KFOI7rMLnz
	gKuNea7xSYzTTqc06ZtRTfsfOoh3lZ++ommwYi0bX+fR9NpC5CcmK88KerAFR2KDlNXNCSA2N/B
	auR3NL6buFO0UsE2/Fz74XOQkukGYrZOnsoros8tTHiVsmdy7RleWtXWQyrcu9X6WwrIDmdZfLp
	AArW8HLylFRTHbyeVLIlt0cEHs+aqQsFbqixX
X-Received: by 2002:a17:90b:440d:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-396d0e5e891mr11062397a91.2.1787912988100;
        Fri, 28 Aug 2026 03:29:48 -0700 (PDT)
X-Received: by 2002:a17:90b:440d:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-396d0e5e891mr11062322a91.2.1787912987665;
        Fri, 28 Aug 2026 03:29:47 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f783c57sm5267301eec.4.2026.08.28.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:29:47 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:59:32 +0530
Subject: [PATCH] i2c: qcom-geni: Fix hardcoded clock index in
 SE_GENI_CLK_SEL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-i2c-fix-se-clk-conf-v1-1-9adc72308f2d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAxjkWoC/yXMywqDQAyF4VeRrA2MI3h7leJCY0ajMpZJKwXx3
 Tvq8oNz/gOUg7BCkxwQeBeVzUdkaQI0dX5klCEarLGFqUyJYgmd/FAZaV2QNu+wql3hajvkZd5
 BfL4Dx8ldfbWP9dvPTJ8rBef5BxS9ICJ3AAAA
X-Change-ID: 20260807-i2c-fix-se-clk-conf-89f6f92d373a
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: Girish Mahadevan <girishm@codeaurora.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787912983; l=4220;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=I7wMMzUOTxXy59XXrAAdXEH/cY4Bv2uQCN82eMYlt3I=;
 b=ullmR2ZMP/fubY++Q5rSlO4oCU7BktzJl0erJgJQFGdI8C6Gphm50UBLmKgrNi0FY2YsQQ9po
 vMCMO3C/RafAfGPNSHu22kvWLZ3ZPYBHww8X+LjJiALWLviBoQhz6Hn
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OSBTYWx0ZWRfXwotOfzclWQj6
 Zm9QSAyLguB/ui4l2erqEaWoXcl2qhFR+dtXtoQnqIrvx8CV9vOWRVslhIlRPvtHL5ghBgBfj3g
 kYYIbzCAJaD9Mn0UFhKFgW16B8pVowTpS8ApAfERFHsiWbnUu9zvAoJbyW+XguFaeIlYwTwaNek
 +K/zf/apaCYskXLG//a/zoN/q5alC/i4NDNejT5dwyOaitxPWoF7uGWwATGnXBxVPHRXw8AsBK1
 PZFsXjmj0wNUB93ySQJOcxobsuCPse57BDiXZH+aArMAcnZ3lACwA/+NOsf0fFRqQtHIxdp32xu
 J8A5wb7A83qLtU00CcZ2PH3ly7SbFVrlQ2RuwJ6Uq30jem3JzLLO0YBXKDcvgW2FYz9mLcHBGXz
 0dvlZNst6zGCGK6HAhcOquWhmKiT/JHWJORFJD5Dcu2MYvdn9m2w+EJbbm8drkVwWA1Dw8WCmJ7
 gR4omvBkLeetpzG+oXQ==
X-Proofpoint-ORIG-GUID: rIXCW9MNCjVzjj1OqradDJpx9pdzlMjp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OSBTYWx0ZWRfX8UfMI3X1NqrQ
 k/RDABmmQL3Gbb8j5CSMIZh1A27ay8J8fL3eVhir3rDwVe6jv19WbNwhBC5mlkC9xrQnkYH7ehj
 z0tGaVTY4rrE6uDO8X72QlUkylzO+lo=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a91631d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JoU330fbb_3TrnOeRF4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: rIXCW9MNCjVzjj1OqradDJpx9pdzlMjp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280089

qcom_geni_i2c_conf() writes a hardcoded 0 to SE_GENI_CLK_SEL, which
selects an index from the hardware clock performance table. This always
picks the first table entry regardless of the actual source clock
configuration. On platforms where the matching entry is not at index 0,
the wrong source clock divider is active and the I2C bus runs at an
incorrect frequency.

Use geni_se_clk_freq_match() in geni_i2c_clk_map_idx() to find the
performance table index for the source clock (32 MHz or 19.2 MHz). Store
the resolved index in a new clk_idx field in geni_i2c_dev and write it
to SE_GENI_CLK_SEL instead of the hardcoded 0.

Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..a83297b5fb0a 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -82,6 +82,9 @@ enum geni_i2c_err_code {
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+#define GENI_SE_CLK_32MHZ	(32 * HZ_PER_MHZ)
+#define GENI_SE_CLK_19P2MHZ	19200000UL
+
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
@@ -127,6 +130,7 @@ struct geni_i2c_dev {
 	spinlock_t lock;
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
+	u32 clk_idx;
 	void *dma_buf;
 	size_t xfer_len;
 	dma_addr_t dma_addr;
@@ -197,19 +201,42 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	const struct geni_i2c_clk_fld *itr;
+	unsigned long res_freq;
 
-	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
+	/*
+	 * Counter tables are calibrated for a specific source clock frequency
+	 * and are not valid for any multiple of it (e.g. 64 MHz, 128 MHz).
+	 * Use exact=true and verify res_freq matches req_freq literally to
+	 * reject harmonics: a 64 MHz clock that divides evenly to 32 MHz
+	 * would pass exact matching but produce double the intended I2C
+	 * frequency with these counter values.
+	 */
+	if (!geni_se_clk_freq_match(&gi2c->se, GENI_SE_CLK_32MHZ,
+				    &gi2c->clk_idx, &res_freq, true) &&
+	    res_freq == GENI_SE_CLK_32MHZ) {
 		itr = geni_i2c_clk_map_32mhz;
-	else
+	} else if (!geni_se_clk_freq_match(&gi2c->se, GENI_SE_CLK_19P2MHZ,
+					   &gi2c->clk_idx, &res_freq, true) &&
+		   res_freq == GENI_SE_CLK_19P2MHZ) {
 		itr = geni_i2c_clk_map_19p2mhz;
+	} else {
+		dev_err(gi2c->se.dev,
+			"Unsupported SE source clock: must be exactly 32 MHz or 19.2 MHz\n");
+		return -EINVAL;
+	}
 
 	while (itr->clk_freq_out != 0) {
 		if (itr->clk_freq_out == gi2c->clk_freq_out) {
 			gi2c->clk_fld = itr;
+			dev_dbg(gi2c->se.dev,
+				"I2C clk selected: freq: %u Hz, clk_idx: %u\n",
+				gi2c->clk_freq_out, gi2c->clk_idx);
 			return 0;
 		}
 		itr++;
 	}
+
+	dev_err(gi2c->se.dev, "Unsupported I2C output frequency %u Hz\n", gi2c->clk_freq_out);
 	return -EINVAL;
 }
 
@@ -219,7 +246,7 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
-	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
+	writel_relaxed(gi2c->clk_idx, gi2c->se.base + SE_GENI_CLK_SEL);
 
 	val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
 	writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
@@ -1111,8 +1138,7 @@ static int geni_i2c_resources_init(struct geni_se *se)
 
 	ret = geni_i2c_clk_map_idx(gi2c);
 	if (ret)
-		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
-				     gi2c->clk_freq_out);
+		return ret;
 
 	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
 				  Bps_to_icc(gi2c->clk_freq_out));

---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260807-i2c-fix-se-clk-conf-89f6f92d373a

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021857;
	b=LoYYJBY5UI2pOwesLDQ1b8c6VWb/NUpkrl81rVPzqd2YxWW66YGNThR/eIN99OO+C8Rc
	 T9YR8f2zehuCQKbzhANO5kTLlUZCypErHDZhvpRgYi8rw/waV1DdWyYBm0ZXOiwzFTfTD
	 BFIxLsngqrDbARdoP84XEpJsLH1ggwlzw3Mwk2Zvv3lfgB92mF1yDhJdlppzWh34LoHyp
	 GqEzuld1wz5dpgLEWAHqR7E2fOQA+SGa2kySvyEp189uSpMoZzk38ZeNxkm9oiBQOBPmO
	 6jWxPxDbHY+7bG+IdvpGWxM9cycm1FIE5i0JzGm9Zsi1WnBL0ZIpxwdiSXJE0uxy5Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/fe7KJZz4LmWaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=;
	b=NzeDyMXmLxkCIfuTNLb4qvdW3voElWTquouBXHrh216vpWBDP1fvSNGmfaQgQB4q2rPB
	 24MggMuEI4i1gZOveKvscVTQy4zedrgO5rCowWOvhe00kojYZaWxyhfE3GbB5eclO5b2e
	 CyeEAUZWUhwULtI9cwrJ5TM8hXjADdR0mD3UaaVqC0PzF4Q4wyikETSVoI94qYgQJTsMZ
	 0vEurXZsWuFc3cX0PanJA0ntiQbifuAYCNCZT+XA3nwD1XxjXOxDUg5wHr3owuT42IBG3
	 0RZcGbdoH3cLna31e4X5+T4+vDWiAqEIgff/LmiTzqfz3ik0uUyl3DN0IaUPw6mvA4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a/1TC3kD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGjzd2Ys;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A477C606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A477C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a/1TC3kD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGjzd2Ys
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMgR2541984
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/fe7KJZz4Lm
	WaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=; b=a/1TC3kDuzDep+hYT2a654DKVBO
	BOa7noMH1xnbjluUQkvFU3YJAAiGxIMnMi4mjS5l+hcpCfVVjo4xqahf8KpZvCCC
	75Cy/ej/y7UV5KzgcuNSICluYz0f6V3gnDj0b7X09hcKxB19tg6BDF6OkOd55Rlo
	kLHiH3NMoQbSCFpCGskRyNpyfa3pZFuq/hSTIVnT92xprgyOB6eMzx4z7adeFB/y
	GZaRfSTDvK5fgTwP1ggK8xkU5xiaFFT+GiVJeqh7EZdetkyQf788p9cOtWb4iVWy
	t4GsSY812ci3Tb48KV84HOKQyH19z+KgquAbVmZPVVrzoIMGCNBkHaipKxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdanrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so597508185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021855; x=1793626655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fe7KJZz4LmWaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=;
        b=PGjzd2YsyN2+DZD6uijPrqwiviuBYu9xVPuwqQZhjimyp7IPwGqyR8Sm+Z7YsGMWjX
         x7QlkGLjB+XtIcrp3gsJHJenZSGY5zpMc69s6j63tORn/Mi+VnimSLlPUlqH2Kh+AtYx
         SvftSLlo9J/Ag/FjgXwi/dgRIX4gmcMKvlWYfmP7kHyOL/AcCLn151l1iAn9tIGugd6X
         UmDLyEH5+7GDK+i8o6naoNk9AiZ8f8CT+OUdF1b1w5Arq/0rS8+rcQm+6Y0muiQfYjkE
         g6OFiHxZ4fpOFxp1ZXqgxshg2QfFlVWs+1evAY9PMV7fb4BQYpiBg+sMDzDDtjNlEy/5
         kaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021855; x=1793626655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fe7KJZz4LmWaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=;
        b=T/sZKHmuCJJGoCUutH9G1xVzmfvliikusNvfqdzdJlmFJXBopn9nRD2q3tl1e4gd1a
         SpJI/WJa2j45KbUsYELJEVCDgLAWqiT1CPSawI6Kig7LHLKs0RKYe+mUgYrEEGzgwWjN
         N5HJTk72wuMOAEZvL/3JDDzJEAjqFK8FsaG+yNaB0nxAYrQ4+ANa1D71r10iNhkPazjH
         tcyMhCjdiHP4+3diX52O5cNaBilyxGUCAyQEUDe9dd46WWdD6DATRO4uNFJjmj9kGZL8
         9bfufmTmHDLs+Kf7UMcNxTK2sr6I03wFbL0JMc1g/6potXImhchO9tzAKgHpCjMxZCLU
         Lz4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzKldcWu0a81799sJfohEEov9/QG3uX/CdHFjYzpHSQebzgBaEgPUYhg9aIDdx9TKaWfubVbhEUpVTRxj3o@vger.kernel.org
X-Gm-Message-State: AFq9FYLdcO+3QNy3hgJUR3Iy6OohRtYjyekWU9SepUd6ALcuLh5NHFp2
	wFSFPdPGE5naNqtrQUGK6YWeZbTmQA5hENbLBuiwgmOZTMkmdZheaZ6Q5YhQBvNGjAiQ9focRtE
	qR/zJxEiW0vB5TwDFh3WKveEgvgsFfTOKOQ9JidhjOPki3K8nhJ8GyS5btGugXR5VHL1M
X-Gm-Gg: AYBFou03rFtaTed9Z5ppRMA9ly/TFbiCxvd/8+pYGpbWBfkv2vm234WxS82NEXmGFGK
	u+GY50fmnA/WrBAxtd8zo0x+Ma+SWmvlj7YvKuV8H/evfyTPs/wXsoSLQG/T1e7Y1K19T8Qu1kH
	/uncy1F3hWjOUI5qba77oB1LjrzB4VuprVSM8KnnzdykunTgBxWzTDZlf0NqqeJX2acg0T5QkLn
	KCghWiNUSiasJ/yhwPlezWsYrai1L1oRNyzPakAx26fWVbGKP1SYNyRrnIWo6gs2xm43Ig3p7r9
	qtkIzWtbxduz/vQ/qLxpexnXggXscDUApyptSDAzFFAfRNak5tR0WiTCwdrg/B46Ul/9XFvwYLc
	a7XENRWtwS3ZR/0xV7PxDAunp
X-Received: by 2002:a05:620a:4087:b0:93e:c12c:4416 with SMTP id af79cd13be357-940ef9cee5amr944691485a.82.1793021854981;
        Mon, 26 Oct 2026 06:37:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4087:b0:93e:c12c:4416 with SMTP id af79cd13be357-940ef9cee5amr944686785a.82.1793021854482;
        Mon, 26 Oct 2026 06:37:34 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:33 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Mon, 26 Oct 2026 15:37:22 +0200
Message-Id: <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: n-yYgSK9Zasr1DJbeKqBrlmQg32oYuvj
X-Proofpoint-GUID: n-yYgSK9Zasr1DJbeKqBrlmQg32oYuvj
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf579f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=yH3Gd9U0UaHnWrszFSEA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX8cecbbluzdMZ
 TnWjj8sgUKRvaAKTHuDa+woFKFNcZQIn6sPH5xgQgOlwWdoQ6zjVs55tH4EWYLUqeKqRG24RriB
 gv/artC73YBTWlEgY4LukcqqvTgi50I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX52JRDNMV+o6q
 fpTN5IFg+Wz7WpfxxSY+K8HDzwZ6+v+m9hZO9XPZJT1fgLQ9rE1U52ZnC0kOhNWQu6TuIqERSOA
 wmoKztX29vUbIXIHiYMTq8A3eqY5TdUIoXvCuLpu9DFBx7o9RKyxctK6njB+vZ7EQb6fwACsXOm
 ncO5thaDdDOp+thxjlc2JAcISmTa6JEoGGPUp55hArWcJTwY7JcUjE5YXlTMMths4vlkvsCys0O
 ppiNheTztBRt5Qe4iA0ELoQhUot2TMFyLoBcJioE83kFTPtTYSBi7yRNoVEbX51chAhuCoh3jHW
 dFa/O5HpwbVo9lg1HHKnDeoiHDdFD7Ei1dYKxoX9ISrL7hcGe0BYo8OyU0kqQbCIDw5reYghRKi
 Lqk2/hgbSrJcheS9n2uRDqVcpoW6RN0MWDtSZm3xbmEt+epsUgfffia2kYymx6xBltI7cqqZY/0
 AM3HwpmFK6bIkWz7yug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Clamp each clock to its highest listed rate instead, and warn that the
pixel rate exceeds it when the clock lists more than one rate. Take the
clamp into account when another line powers on an already running VFE,
so that a clock running at its highest rate does not reject the
request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 59be37f83df3..359b5942df89 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			long rate;
 
-			for (j = 0; j < clock->nfreqs; j++)
+			for (j = 0; j < clock->nfreqs - 1; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
-			}
+			if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
+				dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
+					 clock->name);
 
 			/* if sensor pixel clock is not available */
 			/* set highest possible VFE clock rate */
@@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			unsigned long rate;
+			long max_rate;
+
+			/* A clock already at its highest rate cannot go higher */
+			max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
+			if (max_rate < 0)
+				return max_rate;
 
 			rate = clk_get_rate(clock->clk);
-			if (rate < min_rate)
+			if (rate < min_t(u64, min_rate, max_rate))
 				return -EBUSY;
 		}
 	}
-- 
2.34.1


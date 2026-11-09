Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234123;
	b=UhPHwzQ1DWA0vj7YpDUmWEjJxI4Tmv5BNUHwaHJVMRdp3YdMQA8v2JJScjK9Sh47qIbD
	 Dc6VBrEUeFrF0egVhkiYvsX1V/xa3ONAEB8hh8LC3K25Gax0PM4j9LMSjT/ybXwYUDAYW
	 RkfcuaoNqQieC0S8e6KJtinpWKRnT+/yeEirD6Pg5yR+9tsLsIwn0GbyGt3tTBj9YVNIf
	 RjMU7pnxX+qeKufeFcan1cwwzLpU0Ki8BhrotJ8co7ijRlmc+ZPrrmt3xozui3sWJZMj5
	 QeF8COGCeFCvzRcD/H9xsrxrBkULf6a54X6exLhNSZ++vPyg406RT4tlVUtPxVkVSrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
	b=OrdbvvmwfIYc4RpMKqsCC0lijBg1a3FUuWJmIgdnwymTwutVEVv4iQBwisdYH6rOpbyS
	 jeMIqYGgz/M0ZEvA/0J5LhhqjF/St0an7sEw7raMRtw1B+c6mvQ4yl8s5YEACOC77Gux5
	 eOZwllIjjMRqrxPtAT0+clue2zNuG+M3n6vwV+FL5egObAm5UFDkYj3BNK6Y/1X1NTI7V
	 CP9fj5/Xph9qY6PXQCOSM4YEqEg8JwGk3nG8NDV7n1CJCydo66Z00S4/YGkGI6Ez0aEZY
	 m1u1I1mbnwWGfUlp3AyhQpby4hW5npgSICxHvxiqjVMrAOeO5CKAFw60ashkGdC9Tkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VP3JndJq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnKGvONC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDC2606D83C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEDC2606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VP3JndJq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnKGvONC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFBW9337300
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mVy1ahp/P6z
	Kdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=; b=VP3JndJqajd6DkZWuN71vb8csiA
	50Z/rE72BeJq721SdbBfWSAJfwadEbcyQm2eKZ4CM80wyJ1VoTrcgOC+GXgfnHqc
	uBJnZztTTTzsgxAB+YL+MlXWGUSAkO8jNvij4peWkpBbk6WpJeX9r2O5eYXDHvxE
	6DqetY5diSoiftEiyaocqI8+wqPrOBvAAc/W72I/yCDNTtqKwnC11y0dKtdM1SiF
	szI2klbpgkrspXGF3eG3WTl/cq0aTOp13jqNoyzF2QPt53uVx38M5c88TYyxGoBj
	arXqg87vfG1PMTo2+/nYlE8Zrmpvi/MmlfNm81O8Y9ua1KIgJH5u3+ZhvCQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rp4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:22:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso496246a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234121; x=1794838921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=TnKGvONCXuNZCt+zLjV6w1xpNwRWitSMPol0FdrNK4PrvyEMQsG2Wh5Wm7txN7anWV
         YFp98LhVdn2vS6KAxu55ItfJxwkgGu6NGZ6d5xaFyz7aVirMD6VzHjci/eNPSmR6rU63
         Wt7yi8+SC1X5SGesjvPKEYXHr3c4N808u5wOziqk78JPNmSpHyw7IGHK5MNrEY6igB2k
         BgZySWb0HpzYDXKObNcY+qspLFebyAcAFiVaH+uK1/9rLw/btqg2P2DX7Pe5jKhxTuov
         mecLd7zgfGBcygIhzGCd7PN+pEmR/M+ETdMO3jSfCo9xplvPP3ISPiRcxXl+rXEq3R9p
         OPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234121; x=1794838921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=knb9fssxCzzTD2LS2M1O8oqji66KNBId4fAmHGyolj2m9Y50iSox90hvw6oaUI4VrB
         bW2AMpKjxvOs98jCx535qIWx7/OV2DUYQNSxZH7u0LWqvanX7UzjHusW5NO+RpGJ5KrX
         Rj0+xs+bIlJAv7IvZyUML1mzP48L7d7L0+/xBqOMlNsKKRY97WJstUJIsN/ywoBWjWQk
         kq3AkdchafCoRFiEffcF5Lf+psNzfqN7NZYk9NL7lJIawe1RC+q0msLY3Ux/9IAG+OPJ
         PNCtcOA/ChM5KqOvuzRlADPLaDywD0m/M12VAGfPC7GrVKL3R60HR79Hkl+CGDiTBfwh
         POGQ==
X-Gm-Message-State: APuU4Z9y3cG4TM6L1P6/IM7j3tA8/iYP0v4bo0O/O5aYvd2n/PBEUjFY
	/35y89k8o9XWly0y7Yw9s2uaKsCUrKNKN1i2Lku27W82xkFjxXK1MjKrLS8AyqB9POPwmLeeR5C
	YUcU96zwT4YoPByc294mwEU0FsNSoMOojK6xMxKoewtbyZ5FcPCTusom75ePtMW0XHa4Xi53o4t
	rBCjY=
X-Gm-Gg: AYBFou15cFfcK5X57Wx3iOnjmdakDeRC7pwkZDyCwF8X0uGzx4XYQN79gZ7YDO2Curl
	916NBebx81vcxJTrnTSq+zS20ew/qNw5a5jXxnT7GeygwuWL+Kv4lv21TSBlIlwlXAV6MRQveXk
	c4UhT8FW7Icyn3MQkDn82OmhmkUrtMQNt4x+KEXXOrYSolXu/ifFm73RuqEIfzWMou5DGGBzZAK
	t5rqARZZ8QL0yMi7wdEr7+/xIp/6aWrl0a8iQOlqtHiIwQ533rITzznJU+chDJ2I1XeYo/XZ2MF
	rH5MyS1Jf8mRHirRwLnloYPL+4vcqY0d1akPmmasi6/qnUrva5SuE1H+W1QdlRcD4pCfUJNx8I/
	8/TbrmcxlCzaP9oAbh9tntEatknNWS/4A37YJ7Px8yogP6iFNnAjObzf//W869FqCFts0DPjKrl
	oUEUK6SYpx4BK+Fsa2wkHAqJiZtm5BTrrENVG32pk6Wn0JMFZkZw36AfmyEVh4Xg==
X-Received: by 2002:a05:6a20:7f82:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3eed4ac586amr4406570637.60.1794234120715;
        Mon, 09 Nov 2026 06:22:00 -0800 (PST)
X-Received: by 2002:a05:6a20:7f82:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3eed4ac586amr4406541637.60.1794234120184;
        Mon, 09 Nov 2026 06:22:00 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b648e54747sm1400381b3a.11.2026.11.09.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:59 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 13/15] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Mon,  9 Nov 2026 06:19:59 -0800
Message-ID: <20261109142111.256630-14-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXwIY/nSpR3Rvw
 DRETUW+hMDud+PhsmGMXjg4ifsy0ncz0NDyXqe6Bzr1+tV42z9bVR+QuL2cAvfJIR94mgNuxo46
 7INGe4bkiem6TpDCuEWRouL4otX2NPw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX23GlETCpMFCN
 WR5yUYcr4Gb5YYtmlajqlo7z6G7+7L61jIxDVbD+y6HbhfYBpxZx2/RGXeGexvqw2vP+F/5gwGp
 uM/lfXDqT23B0Ldx+YVOqdkikyn3Mx3nSfNpAqSMjc/ZtLAwHBArLjODoQ6T9L/wfKQld+RLAlb
 0EQO3tGJ66RSt1OdBUFXUI/RCVqyGc+r3tesubTW4Yc5opTDDDp7Lh+KvIQGmHjBVJNrE4yCn1N
 k0nIdI8Zk4FZxVaU5D65gJt1RVIRW4IztmBGuVFsFZCgar2q0V9WXgSJL8XOw1ca6u9+47f3q77
 qsUII+51UDwfx2i7+ALnNzHOe85pOhA1L/EuHOuCRv5MuNuTUQYHJUZ3IWIc5UOQD8Q3IvOnbbD
 sVnqDH2gDjsQ6a4kFoq0yRzMiNUYVcVKeRz03kS+ozau8ipIOj17FtwxFbIUzXq7GI8A64Ppm9u
 0H5Qe+zifhyjqI1/eGQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1d709 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UnxhJFuZtzOLgjs1IeAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 2w-hifVHN7gj0F1tr7TUnt1bXhi0EBfZ
X-Proofpoint-GUID: 2w-hifVHN7gj0F1tr7TUnt1bXhi0EBfZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f65bf82e5c21..f6afa5b3b0bb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -261,12 +261,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
 	a8xx_aperture_clear(gpu);
 
-	for (i = 0; i < protect->count; i++) {
+	for (i = 0; i < min(64, protect->count); i++) {
 		/* Intentionally skip writing to some registers */
-		if (protect->regs[i]) {
-			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
-			final_cfg = protect->regs[i];
-		}
+		if (!protect->regs[i])
+			continue;
+		gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+		final_cfg = protect->regs[i];
+	}
+
+	for (; i < protect->count; i++) {
+		/* Intentionally skip writing to some registers */
+		if (!protect->regs[i])
+			continue;
+		a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		final_cfg = protect->regs[i];
 	}
 
 	/*
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717816;
	b=NvXxGA5hKlj2UAyX/c5vQaYcAmxrORhtaoDMQAd3fsVHnzqO/32gNZY6gbQxtCk3XK0N
	 RiJu8dq2yKbBE3SrIFwq7FyDw9nN4pn6dGCU3e9870OBLmu9kw3lXlOtEzWYhiu7VSk4/
	 77Lhi4OhhvmmczeVt0qztmbmKNV8DF8UOcSzU/bZpoA741QlkTlxTmvw8OGfP83eHXd/y
	 JWWa9Mb3TgtFtcFYLxpw8za36AD4xC3yuZzkkZ3+EAydL/0nSb8fc4Esf6fM8UXsb0btW
	 AcZyyk0A/svlRDEv4szBmiWbdr0XDMmiTylEb7lmAjC2tFTjkZaaIvTRVo9M5sjLGSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cdBo9mVe0UeY3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=;
	b=VsbNycLqsx3tS3raT8H0l8/CYoeb+fn9p/k5xuB8HJUCrxvadKB5ZrKX0Z9383R0Si87
	 /XRbf5BH4K4X4MIPJnNNsgqmcIHoQ+clhi/sFfYCCZxI8usD881YfGcYnHpkNTWj4Jlz1
	 5e3HfdTAUqkeL6sbEBxxvpKpL6AC84hqhLGA5M4OPQBTyv9lbAdtS9OF5MW/Quli/chaj
	 RVXjt5/ApgkbX4R2kIQXVguSW/quk2DZwyprkYUKtnHGwleR2/8Jt4FMVDgraXZtTafei
	 FIFbU37CZZB2QGMD+AWnHfGwFKWiYi7RHGSGo9Lmx6d2riCIdHDK7Sfb6ObJr4zqsVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cvtsa2e7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kcf6YYfN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D94E606D805
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D94E606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cvtsa2e7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kcf6YYfN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EANIB3690183
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 14:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cdBo9mVe0Ue
	Y3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=; b=Cvtsa2e7SLPYu3QBTjbc3HQbPxV
	dYvVAErcU7W2buw05fHOtgtWEecIWH8GwPOQGWzUTNWvvltLrK9QLRtRdyP0G8Ts
	CyZnuFDNFLlc1KbQAx5HPY1QbTolKdRPxFIPwbTgmVK1ImmDKMTqLjhJXQwenpyi
	1RWrsBzQAyAQWWYGFzGTpgSXs2HEG1BoBtNF6ak/Q50lHa64fLmCuWBrZaUo8s2O
	igZeV8DVrR8aeJbVZ5xOMdo5Tm3umrEX3X4tnOZWKQung921HcefeKqyGRJDvq6x
	S++JkPjnNIOTJF+C2QgJRk8dRul9+brpox+9++m2MaHzMF29ufoY3VP1NDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9at6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:56:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9440b27c1feso746876385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717815; x=1794322615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdBo9mVe0UeY3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=;
        b=Kcf6YYfNmHU3Dpf4x3hL50KAk2+6nCQucd4Qq2iXlw1Q5pxQYX8hEDpoV2YmkHv7wm
         b3gM7IQOqopCs+wNPto3XezbL9/1vkRkyIXAlLuW/RpqRN7ZNg7n6//mf3i4AAOYL1lz
         73XsYMPGGQvw8aJbpa/ippYXL11LLdn222BnVEa5A9yTkPEitV3WZrUCoAevHPPmJRq3
         fN/SkOw4OQMFhHzKkY2EFGsuVYzMnLXX4gGk3mKqTpvTEBCLa7lSGbyClp8re7yud3ZX
         yXrHev3zoXo37XAatSwWPSIlJ/HRxTFO2n2gn9E8VrmHd/w181RMcwUjhAHkP9/atQme
         67nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717815; x=1794322615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdBo9mVe0UeY3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=;
        b=ljtylXxnMSEL3aczkYMaCz9H6W4NtCmd/uJ7+pHu0JyQvxF/2tU8h1zM7AM6ad8dg5
         xSHV0EhU8//U3igqCNmNZAr6piU1vpK1rUHmCtdPR6JHnI/nPwdyhZafAcoftkzT4uoQ
         UEPMKrzbimZjdzvSdmYaX9I4NNnXbX1zhOBzHjufTQXs8pqpOpikMtkylYACsSodDuar
         L7840Dgkr78YWJ6kA3N38d4rv0Ine41CiyEKnA6G250kQkyPW9/c7m+7TE2nh9KYCGyg
         j5quAyYRZ5qKuHh/HZP+9Nh+T2/mp+4o2pBay5Zor9kg8S7tTDaPv6y6jufzWUE056fB
         erBQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1eqBNuplDLV32jd8OdBbVmYiPOVAmabXXIukyBZvUhG78zP91+h1m9lRMXxnJhklP1a2xm0QIX+kzdr45@vger.kernel.org
X-Gm-Message-State: APuU4Z/FsFnrovFNe7iStysjX6DFZ4bBirt8hE+G5h22Bpy+QmI1fkCx
	AKQd2AQz5aPhK163cImZX90A5LUn8w5WhG/mA6s5NLxOc/XVXkTwbUeqYKIeBmtYctaVtfz9XRy
	dYXH6oLZWeNOHfM6UuZAd5GjfwGMpajO/buHhWuH1kWCOu1Eq8KRphul4fIjrF35sGBoo
X-Gm-Gg: AYBFou0LFZ2qdvAshvkhTDQww2pC6Sf16yHCaOJvc3F1BRiW6XAAqEsmz4e/c8HfYZj
	/a+7JUgUybMeDDNGlv9S0+CFz1hKuSIbhRPxNLpHrt/pDIClluKhSOFgY8c598M9tyrJYfn2S0k
	08AWEN67pBrnz3qJdjvzn1/XYJi+hJkGLhqL4AZF/lgz5zD/GdFP3pG+BtZiW9pjUDbWCYObjmG
	f2WIcNHgkyqEKocUA1i9eQdeHreCQfOq49AFqPKL2qR7cjxtmNSjN2VI+SWBoF7706U9xm7hUzY
	HnCZ3oc949xcfsqtGUdLPs3+wC11altNbn5yeJNPtQ7XWZnK0i9Q10/mcFh4xkXOX3a5fhCDipM
	rP0YraU6mToHt/abPuzGe7Yt+lWa4Jo5QnvddE3Po7Qs+jW+6LZRby3J55FyNJg==
X-Received: by 2002:a05:620a:28c6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-944217b273emr2032089885a.59.1793717814555;
        Tue, 03 Nov 2026 06:56:54 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-944217b273emr2032085485a.59.1793717813763;
        Tue, 03 Nov 2026 06:56:53 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm69772645e9.3.2026.11.03.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v3 2/3] soc: qcom: apr: Fix theoretical use-after-free of GPR port on concurrent RX callback
Date: Tue,  3 Nov 2026 15:56:37 +0100
Message-ID: <20261103145635.309032-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yYdJk4Nh9bjDwkQjTd65xJ0ln1AEvLle7aeRhOxiKVw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6fYk5xDs2v2v0S9Vc3AsS28hCTTJTKLOCbDOv
 UvAu8QeIc2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaun2JAAKCRDBN2bmhouD
 1yLBD/9KqSkTnbvxsy41ZgeFzvUE7qXMix8YA+sVroMx3uU3IxnwPb8FCR09jU5/VpIzpM00Ieb
 R3l5BbF1ZMbypg6Xnbto0676ToHptuwYwsEKO0qgWC5wWWMEt+yCiFqBdqgbyuobMjw8KAGHysl
 WIbi2tggZ5+D2trvF1GvkROhSakpDDFb6vfwdGm3Uwk22ksH1oi8ebcw0rdHSfd26badi5xUl2r
 vSNBCBHQcZOGlTLuh0GIsLkv3RzfSgtJg7XePs3tyyA1uEpOIgjYD99UJIPUHpYDg2qVGec9q9T
 oM8lP/a6wmPYihu0dEMEaek32JEaIySPhKI1l+qoD3xb+vH2/rJIaKPX2jg2w6aj/UoNis7Eq9M
 UeohLPQOEMR21IJsE8AmLwcuMcO4rRbzN711mFLMy5JOeB8QXd8/i8KWsqYZGni14jOL/nNqmZE
 GKRrMnSdf6+9o4Q7s1lcZwq1A0e3QYLQKNLXnvNX0SLUXMWUApZNcTINfRzb4Z092YPwa199jAk
 tpUQCZBVv93Bqtjs+kO5nFkljDHkgGKzFI5uKaUN7IgcEFu9BD1Am+Jh8Coxz2vo0a1Myg0K9aT
 hQf3eh+AK2/IuYkbPli1ErCeoqtjcrTiLZph1grcVNOYEwQ3gbZDEu9fKnoJNKjzNaNE09m/O/A 1ZY4o1IfB02zcCA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aus672ZkClHvvN8weJtBNYjlf40nLlKl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX69Rf76Adop3x
 JTb3hkedXsO3B1FlrOBY7BvP2b2EOtJVPQ3RzeDXU1HcYDGkhic8oWPKoagj8N67WZV9+b25sK3
 GRfFiMyeYcfMdCi+8Gr+4p7TlmuJ68Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX71u9jZ+B1DBY
 n9+3IhhF/TFToKOREAcGBsElPXsFiIwyNVBsuMHmSqyyKQ7ZweHu3SQQdN/8lNavCHwpjnDsFBm
 V0l4sxq8FWHfjj90mTrskl2J/x75ecPDOlYrzCXRQHgBBC+i7mdts0hfZW1WP1lvNRb8U+GzMnA
 8iqol1J/QuNz2nhsawagLwwTCYOoZACKhhrTqck+cBAUpG3hvI8h0X9Iw2hO/ChlLQAgaKpgfpA
 QcgCTEMNBFM1mH9BDHcjmPx0vSvwpkPPbf9FNKW5OHmNNEIJP3dVjVcCPf49tlfcRdTo1EcGmIa
 wEhZ+0/jonsH9o/zyaGECsLJYM07W6ZZqyrpbWH9g7Zw3bxcji6Snnxh+m2qws1FkD2dfhkg8F9
 0Jlc00moa/YYfDMPyqOxdCufqq0EQB+tckYdoz4aVvbBv0i10447iyfohLhvPGG0M7OiD9qZaZ1
 DYN1AY8ILMe2ecglUZA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9f637 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bqjVDHCIK6rrShMHOGoA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: aus672ZkClHvvN8weJtBNYjlf40nLlKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030059

gpr_do_rx_callback(), executed from the RX workqueue, looks up the
destination port in the IDR under svcs_lock, but then drops the lock to
call port's callback.

Concurrently closing a graph calls gpr_free_port(), which frees the port
after removing it from IDR, thus a theoretical scenario (not reproduced)
is possible:

  CPU0 (RX worker)                  CPU1 (teardown)
  ----------------                  ---------------
  gpr_do_rx_callback()
    lock(svcs_lock)
    svc = idr_find()
    unlock(svcs_lock)
                                    q6apm_graph_close()
                                      gpr_free_port()
                                        idr_remove()
                                        kfree(port)
                                      kfree(graph)
    svc->callback(..., svc->priv)   <- use-after-free

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-1ebe255f-a874-46dc-b7cc-455e7bce402f
Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. New patch
---
 drivers/soc/qcom/apr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index e303562526d4..80056bd0686b 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -83,6 +83,13 @@ void gpr_free_port(gpr_port_t *port)
 	idr_remove(&gpr->svcs_idr, port->id);
 	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
 
+	/*
+	 * The port is no longer discoverable, but RX worker might have already
+	 * looked it up and be calling its callback, so wait for
+	 * gpr_do_rx_callback() to finish.
+	 */
+	flush_workqueue(gpr->rxwq);
+
 	kfree(port);
 }
 EXPORT_SYMBOL_GPL(gpr_free_port);
-- 
2.53.0


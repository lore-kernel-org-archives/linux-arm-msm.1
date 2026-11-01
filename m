Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555662;
	b=bjDWYTJrtVtMtLVIq8uX+OGyT20GZksLY1+e0HH7ucKgk/iP/vEUjt5vqbfnlvx2bHPy
	 T6RomyyvXFfb78YXPt9jQpnunLkeQpti5zjB/aTk4lLJMH9NrzuMERzgeOd9rMUhZeiEa
	 ZBS4gLovuDur+87ifF+IIhGa9SRTPKhBil2JqMktiBM8yTxDCZE41Lto7LjkltKS9J/Dc
	 RKv2vEWR5PRlhSq+lOqNW9tPH/7V/46F9oKjzqj+M1Dvokx0MIwlwLjaut8gVeNVGqXhy
	 tYI/X4PxTGqF2Z9U7H9rsy+wHfBRwPGqyG05F0FJDgo5azKAUWVURy0w696DAbtz7CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kdtmiZdTU1nXwsamLd7Szc08WcYoKl4Y081kH3kHkjY=;
	b=OCqaAg/OvOIcCGV0f04Nj/DWi9wDFkF5Y+RamaHydtDUsNh7VENts0Dvq+U3eBnkGqwn
	 eoszDXm9lDkeUMgNHFZ9G4Xe985KRXGEqqIaUjFyUNZbuXi7XkkrYNC46lj6YND3DtSOz
	 RWabYisCXJySLexJRK06ggltzyk6tf3xF9kl9RncDtzqhNkfaHhE4wi5h0Z1wKl5dR/qn
	 gSuuAanojbqcdg02bVHsltbZzw5KUcN9VrDWWbA+6fWuwI8BSdg7W2WAlpvzOm51SeFO2
	 YZ3cLmbhyY948y3WIJGxB9QxF17w/XDBdAfJP8F2oqXKBGnZMuxJaeDngNQTI8R9Azg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOMHyELc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi5g6u0w;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4AC606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 17:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4AC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOMHyELc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi5g6u0w
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQKSj2044163
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 17:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kdtmiZdTU1nXwsamLd7Szc08WcYoKl4Y081
	kH3kHkjY=; b=jOMHyELc7YKJrU2lbiIdQ8ccYv1sGKinrcX6pRVIoGtPQxOKdTb
	ajo2yPCyEsZ6A39YuRUua/PyVE1HSgsTC+msvcgMy6cilaXVrQMAVFoB9Bk+eF1k
	eq92zAc7d4/T/AJwx+pbwM40qKvHg0DzS/fjR5obDCft5fs9t7Q320FLeRKME+CB
	pxBlv6MlKSPQklbPtBmxwan+oZDWymKUN7AByfw/mCz5YfZ4CjlUHmjjsaXSsaHx
	mQcmFHGUbGPYlwAca078PwlIxnNtq4zcw5T9ITL55M32VRMAOqp3WlpmeTkG9m0a
	Ou7DmlNQPHyEM/8lpx0wf1wUpL9nMZfj5FQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxkw4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 17:54:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so463667185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 09:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555659; x=1794160459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdtmiZdTU1nXwsamLd7Szc08WcYoKl4Y081kH3kHkjY=;
        b=Oi5g6u0wMuPbL5mLRDY7c74PZ8cLNzU2KBdkGN57JzUWNpr5q7ikxRd7tpPCIV7q24
         VB1P6kBGuIQP1SE3diaQUEZvaIeicGP0vUjVguutSKgQ651+f7rGp9nLAf1lK6AcZOJS
         dkA06vCtZbfAxhxGcs3Bq20XrUdc3q4DLNDMuS5C+tL6ZNxUyX8BthbTxTG/tbVy5+WC
         DUzCorprBAY2IiTvizikDHHmI/5BRhAVgmEgkuXayJtW5KBynXa4DpA6K7fdO+u2IhJz
         zqU15DEKkp/i97YyZsPW02HVRqfvzRRQkLrAEt2PGL8hE1iQTUcpNHSEnSkrXcV9go0K
         JGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555659; x=1794160459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdtmiZdTU1nXwsamLd7Szc08WcYoKl4Y081kH3kHkjY=;
        b=tUiRHhYS52K9sybvuqkCWxsThVklqHUkHSkTnJ94OvOxr9H2KP87XoWdCd6hocxPcZ
         +aPdnHfwMzSiaJ58XFOLob9gkSSaO1rpBFPDf4/VKwWyJPxpOdrL31mQ/f0TYSzJhjF3
         DQzwAJSs/Ly+qT6C6u+IxHaXYq9dSlh2cF+Lsc7v5l6haDKZ9zTSfGSYTVHwiF9TmFl/
         Y+ExxfQcg7e8qvTwcvjOArPSF2UYZ3B4IcmE71J5m95wpuuUHwt3YOlGNlmBYFcGvbt+
         ZrS9ov6C5HEcHdhf4dmCeut14NhUSQEb03zxWRDc4CKA/rZiATFg9AiLQfBNTRkW/95s
         oiIw==
X-Forwarded-Encrypted: i=1; AKwUvBxqQ6QE8M0c95vBzPpfU8rcw9uTRTowI3XD0/U5fCnM2kLstG9FfOyOhHZOphZjcqyzeNzjj86cI+4KEKO0@vger.kernel.org
X-Gm-Message-State: AFq9FYIrFWXsgXk2Z9ollq9JOWt7fTNm2JOSgfq0EwuYA5T0T7cG6PsN
	iyxX6WTBAI0cZC8N1qT3cmawpfyvVlzFM55LjrOozLBR5ykaPYGYBzjHMBr1HoPQ78QVjfEf3Bi
	ZX4gRot11RTmsuC9fa7wBZljzBCw3DHnm/t6S41DDyngYv88elBAmxos4dpAChkbdumqf
X-Gm-Gg: AYBFou2vwULZHuD2agohaQARwp7qS+Iu1kVDcAXqsuyXav1TvTopduTpJO27FqiQjl1
	R0rmG5Tgp8VOmw6mcmJn19sAM4U1MtFqaXlUidMjO9ImFzZidAX6cqB7wJkHwdk9OdBVpGi6Sir
	+tF2AZFF7bHWbtpWgOGwH1JQZJcpujDf4ImIKE/Bm6wA/FofSSPLzRCWrNyUUSXYBJqKi9Fzztm
	QztgVEKx2pa1Xgv/B6301eFSZYdxyiq5qUOtV3UmhR8PcVfNw7SB9IosFtbT/1+okjnK5rKT0GS
	pU9fhfshq08S0hxxb+6vu777p9MAZnJoXOlkfhlYRDhiprYB0e2sSUWtHo7mAtVuq9fFvXZuapf
	oVbamLV8JStee5fuoyfwPB0bctMZTXYDgbZZT1l5mODTl+u3s5+JBm2EDpoAsAw==
X-Received: by 2002:a05:620a:6848:b0:939:ff85:8067 with SMTP id af79cd13be357-94421663f42mr1273098585a.30.1793555659057;
        Sun, 01 Nov 2026 09:54:19 -0800 (PST)
X-Received: by 2002:a05:620a:6848:b0:939:ff85:8067 with SMTP id af79cd13be357-94421663f42mr1273094685a.30.1793555658425;
        Sun, 01 Nov 2026 09:54:18 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm325714735e9.5.2026.11.01.09.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:54:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Mark Brown <broonie@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] soc: qcom: apr: Reject packets with header size larger than packet size
Date: Sun,  1 Nov 2026 18:54:08 +0100
Message-ID: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4MmiwbTe67Vae9D7Lm+Zj++XqRihN9uwcpy1QVEzwR8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq53y/r7BuYv9eK3+a8QHoZBIisHOoqo5rhSCYT
 x83EJSNlliJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaud8vwAKCRDBN2bmhouD
 1y9cEACPaj9qjm4Xgq2YAlnapjZ58AL8Ampb8QNuC8Q2em4csesDfI7RlNvwHxZkbCKKftlHP8q
 R1l8jH6moeUbMfPMFoqbtgedazQfS1q+MVgIIzgI4yRkwf/gRPK3dOEGs74dGL2/VRIqriImqm6
 ZRft9ZDOmNscRv8oSlf0cSusfzJhaY76AsT5XfhvdVxv9HHTCCwHmlQ1jqd+CJxdcXjpjdbuJ3/
 f9da1/Wqa/x77gsXo70d/5DMqX/MFjIa/zcNOS9cz06dUAXqd5P+/Xj+ccr0R9o4vzaaIeXZuo1
 +h1xXwIWbePSbuobLX9bs4kFqAXeMiXV//+c39eMpZaKEcwP/i/xo5/zX66AyvKrEoK+t9WzqV6
 lQ2NSAs6ckCdKUAO06lNAcmmk0wo5p5smBNYyoxqTA4a3HdYp0KMucFEseiIpjj4SKRbXSlO6r6
 M2CVnkiKM3i1IAS5NJ8hwuJiJ1mPhHMJXWZ8qyLyUbu6FsvjcdPtyBnazeo4FnZMBO20aGvjTOA
 8g+IkgWoTb8gHMAux6fT5SReiBGW1txvpPx1afafp6sbvTrp2Bl+VXzGl2YoiR68CnRo03I0sww
 wckAJZ/8dfTPRSGKulNus45bOrJElgXwaAZew84f6a4qsfFQTdzSCDETRQaUX3+pG1IT+Tqa7xM u1hWjU49i/JprBA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6jiTYClz7DsFTqjT19qkGsBN-HQuWL1W
X-Proofpoint-ORIG-GUID: 6jiTYClz7DsFTqjT19qkGsBN-HQuWL1W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MSBTYWx0ZWRfXwTfcbWVqL1tK
 1PicFSfHTpx9JQ4gkTCIA9yKWpb8q9uraj3TJAMdC/qYhU6s0c8lIzaB5NSPdN8AljsM+EHzKID
 kuKgthru5BH6+VLxYaQbZHlKV9/WT+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MSBTYWx0ZWRfXzoC0g4njem9C
 +h0/2T2npGFoAMUQyK3Uuc4IwdRlyd/R4yHQkP62p5rcTkOIIO8/SAKdoPgGGC1wE3/9eFkbbZS
 0bilG2k1Jih5WD2bfVyw094lqM8rPhus9ptOJ6yYzuBDt7g93tbD9ZZlppn9SZDUbju4hLc0dSI
 iC7m+hAgEnzXi2MSYU8oK3apJFkyin3l3xPzQITeLAt+yG0l2Ds6peg40Li+VblEBfki1tjZCe6
 FMCs5kSTya9Ero0ZxF7X0MiXHyFVmVgWNXYY4wK5WRYhimQ1E0lpiJBumsLrlrRL3UKZs5UHDoW
 emRZUNeG7DxDT2Q4efH9WC5pMUhdpp/aw/6KqyJ+7nha3Q7350asA769QtO3DlrhcODSVZwts+p
 5OWNaovDZFN+C5feM/Eei9uPZs+ndNhiEuc0uhDbsk59T/iCJRg4f+qNweVyY5YzOgShrPpYh4j
 LH5Ar550a/cPupjmasQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae77ccc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DVh7n887_SxPlczGqH4A:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010071

apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
and the packet size separately, but never check that the header fits
within the packet.  Both sizes are u16, so with a malformed packet where
the header size exceeds the packet size, the subtraction computing
resp.payload_size gets promoted to int and becomes negative.

Further check "resp.payload_size > 0" would fail, leading to
resp.payload left uninitialized (stack value).  Reject such packets as
having a wrong packet size, although unlikely that firmware would
produce such packets.

Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/apr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 2d5645ff9919..6f29b57aaecc 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -210,7 +210,8 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size < hdr_size) {
 		dev_err(apr->dev, "APR: Wrong packet size\n");
 		return -EINVAL;
 	}
@@ -280,7 +281,8 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size < hdr_size * 4) {
 		dev_err(gpr->dev, "GPR: Wrong packet size\n");
 		return -EINVAL;
 	}
-- 
2.53.0


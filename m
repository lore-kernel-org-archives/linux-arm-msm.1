Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775626;
	b=CC6z24uNkDjuAABnE3gz7Pp/VvL5KmSOG26rAm7N0zD01jhNCygsxIOmBEIzVL0VhPyN
	 X3vDGWbvfuVEuCi/nz8rCkNlhBzE7gt2tXuDkdhCcBHXcX7P8fSEJ7kKJGmQP4YM2Wu4m
	 IQ87+mUNuNN+vbqRDt7+SxQlV12oDf4av9N8EXIUb97boiY8gylW21kV8QpTXvcKrScbu
	 dlzuLTdW1wtCV2+m9ws7HzJ76De/718zAT5+p+QgXrhVMwtX/itilymr+iI1Cu6EC+MIK
	 fakZRJZKRPPH/vH7qlR07ITbV7eBuX8AoMapklWW8mVv48a9ZsS/oVV5jtgxAIC2Nyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OVN8MgXLkPAfIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=;
	b=f/BpZGAJa7X2HMDQwyJIbFq9NE0+r0ehKbNCx3oYtV9/9IWneCYwNat5dzLoaaDlAX2t
	 bX/REE/7ZxjvvJWVOdN6cJTxy/GRyWljSyBq/CJq+88/q8R7XWl6wftzIyYBo+2lV3j4K
	 Crtld11kNc/yf82KzRii0ph9YQDsJFlBeaLJA3AeWf9USd6sjWmDUl7zHQXeTmrEz1JzP
	 03pSTYpRhjMR8AeqVeFxI2qBNyMXjyMxRCDwOJndj7RjecZTTxQcaGc0tyAYvmQKshoCA
	 1SefN7uH2JO3MvZypu9OUnBaJqLSkdItQ6pv+V2hcPkC52D9bNocfmmJ1doU4qRMfZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4KCQuA8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTFELnSr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F9A60A380E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F9A60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4KCQuA8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTFELnSr
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5sx14072746
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OVN8MgXLkPA
	fIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=; b=G4KCQuA8mq0zHvgxNoXLnzzir9y
	cGRhcpq/c8z5hVGSfNyivwtosnmsmGswmIVBiTvpKTp0KU3R5m68mPkPgYJ3zBA2
	JJvzIXWCd0Axev4irJEclxFoEpwM0jNudpVvEDBuCjDbDsjN5c1fHihjM1SMcZui
	cMmZkA56HRloilbt3fM4uTUIk1at0UDfW0xMg13JZBIvRCBMWQXQhsHzuXq44Nqy
	hdJt7sCWrs/AtKnxz/d75lq597wZU0LfedY/Bi7x1r7T+pObS4T2v11jzlAaqfBk
	h1E8WkRCi/E1y8KXb6yssm0JjXkc/uJNuaXpkC7COhtPPlXOSvnhZ4+Vpmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw14w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso140682285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775624; x=1793380424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVN8MgXLkPAfIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=;
        b=bTFELnSruDdiR7Cp9Hu9Cug/m5RTxsIakwzHQqHSfvQsT3h1+akrvleli9Y3T+3mX/
         1g95qHQpuK4MvjkZ80UrQkUH1luibazoEgDO8WyGRvuWRQC/3aUJg0sWrGpgQq0Hg8Gg
         S9OUwhjZ6SPsMkq8ntQfrocsxN7JZ/vwT5BwAC5JYef/qbKdO8Q8le4tAt5I6QisKKdH
         21BRNudnjaR8HQmVCXODhVueidcT3k5zPjjdnV0LkJwmDkP9SjNbSz8el3eWIw6Uj4pF
         8ADhcYkLMs7ANwaAkz2FhNc/ffIEKJ3xcfF8/z70oSbulthF0K6Jdc84oPk+Kpttt9MU
         ZgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775624; x=1793380424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVN8MgXLkPAfIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=;
        b=w1TAkW6P95NKNTwWCPTc2FnCROwSufsXlNgtulAXlz06qiHUiLa6m12qE6vkX06dkQ
         5hNfTQDr4BACc1mM6KjDrZS+VGK7+TymrS41q0k7y2kePtufPxFlCXPWVF2FqT9dWQQ2
         ZI63guiJpRnVlUAm+xquw32e38Opljgd/1q9hyPTHG+H69inue/+WMBwqUXnt/7CdRRh
         UNBbVVvGmMkXfFG8mJKPlSjtQI6m2iKI8pYQZsYQj2oP1u/lktKINPomKmS+DEjWmlIE
         vgiERo0pjbFZkZv5AkwhiUZ44EG+Yg6rVQAMJBv327+DVvorLNJ8RXRYAqliA+5tzhIc
         ePdg==
X-Forwarded-Encrypted: i=1; AKwUvBz5KXg+d6XAklzwlzVqvttiSBzKjbduz5++szwfbG6dhVKe3CobGkKQp8VPDb9g5TCAa8JwLuY42ht1cFeS@vger.kernel.org
X-Gm-Message-State: AFq9FYKR1WhVEbR43VCDYxEB6NJZ/KBG+nPLKwDRuR+IRG/aNvAwUsQL
	ezb9wK4QgD/aN24a67F7mZzYCYyMMTvyHqGi1fZYKvBXH6oJ3xf/vYQ8pHYOZSkGMqD5vERH2jc
	BmDcuFBd4gRFsyR4XkNwVyRy2Ehi7bK31eiJHlfeAcazuchUUo6AH432Y0qdaWzUxLsJy
X-Gm-Gg: AYBFou0Z5OgEYYjI0BXwD9juhUZQZ3L9KVOUVZurPy/ah8DLXW+ThdTkHE3r3LhcvFL
	kaJOdE0sv3MzPBLBFGXgzJ5qTGpDq6wLwCgz10rMS1+eCEk9tPvyZpBToNNbCl7Kina7uWnKi+e
	cFDQPK979Cb3a//3fGA4MQ4p2oTT8t73NBJaPDpz+eH9dEPa1m9lAIiTq0OWKQUedI87TN+0xPx
	YP7Ln/r5xP+0BroVqTZHx+X3m3y+IUB5nvLrIh+XB05wCjmRFxKkct4hgzscOSWMP6FO+INLpsg
	3FaxXafwWUeYq0bD42ZAzW5T7dsrZb7Evl1uoNliQTKE9Ap2fnCspGIHJsiGFY9OSWlnYjhqMNP
	upmm5nMv6sqpk
X-Received: by 2002:a05:620a:4725:b0:93d:23b3:5088 with SMTP id af79cd13be357-93f6f907cc0mr529822185a.16.1792775624502;
        Fri, 23 Oct 2026 10:13:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93d:23b3:5088 with SMTP id af79cd13be357-93f6f907cc0mr529817285a.16.1792775624049;
        Fri, 23 Oct 2026 10:13:44 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/7] ASoC: codecs: wsa883x: Fix VI sense port channel count
Date: Fri, 23 Oct 2026 18:13:16 +0100
Message-ID: <20261023171316.819857-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Htqc_0NUnJHf-Vb-FGZSYqvXl3FNG_wK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX0jEgV05OkG4F
 1PI3IiEh9NS/Ul5rivUIR/g0RXttpRTtOsd1Bzci5v6w0gGtu7J3DJhKG6GlinUwi+JWK5c1910
 /f+2kom2F1cYKUJ81/1ZiW3B05Mlr6A=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb95c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=AfZmRdYrrmokTClfqrwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Htqc_0NUnJHf-Vb-FGZSYqvXl3FNG_wK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7vUgbxnRp5qC
 VxIrGYwPY2FCFEQVaj7/wwCKh3pyzHNgcv6G9+z8E0mqfvAAEPSIaZh9XL2S33wQq4ATd+Toc5Z
 3mix5kQPB1XQnaJciuCLugWQtmcEQm76ObiAiVK0GQj8E07jABA9SNZ476Xs111XR14q7CMzQ7d
 4UjvBvN7N6sX0tMk9KQ889izpHXQG3R9QLlM+QvvriTBTTWgQ0xjts0/3oTAw9epYyv47sIZpT+
 L0G8xcXDZsvrG38G+Arnlrk3IfaD34zfcn2iyw7dU9tfrkOnCa3Z967g6iGalhKCbl4FxY0eXcr
 hBL5sb+iubxMne40f6hCAc/No2lUifdzVSsnVShtk1/oyPuBz6uFYl23+ibgPXXVN06dBCshcCk
 NMxkni35GnzseqXiL9bFgqpAR0zsuZdNBcdt6P34yBVn87V4UOiB1p94Bgk25lTPE7Mgsn94SxW
 GkHjp6rr+UnO8dl/sVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries both the voltage and the current sense data
of the speaker, but it is described with max_ch = 1 and, since commit
ed3b274abc40 ("ASoC: codecs: wsa883x: Correct VI sense channel mask"),
a channel mask of 0x1, so only half of the V/I pair is transferred.

Describe the port as two channels and set the channel mask back to 0x3.

Fixes: ed3b274abc40 ("ASoC: codecs: wsa883x: Correct VI sense channel mask")
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index b09ee3db7ed5..17d8babc6123 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -552,7 +552,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 		.num = WSA883X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	}
@@ -573,7 +573,7 @@ static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
 	},
 	[WSA883X_PORT_VISENSE] = {
 		.num = WSA883X_PORT_VISENSE + 1,
-		.ch_mask = 0x1,
+		.ch_mask = 0x3,
 	},
 };
 
-- 
2.47.3


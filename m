Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775871;
	b=CvSkfd7nRNVUKMA3dUoF/kg943lrqe1b3XpvwXUedzZNl0SVvm+DyEc41uKozBaq4mmM
	 5Xq4ke5giRBhZh5JTO0haJHuznnpXtb85dO3QyjBgoaaLGdhqGMlpP3Sii0aK8Aoh9m5z
	 HavQgJCRTAS+aW5KcC/GZLutzREwYOpvsC4/zgd7zXmxhJiN9Va9ttLCG562vv69+Jy3u
	 n2t8EE8JL8VlEAucVvQLgN176goIdyCnpqArrn4+3vm3HA7AsNqiLbm3eCG5aMgQiYQ8R
	 gahDBnTCA4IZ2kJ4Jd1hOGJQWDyW4lsgHy8ewrF00z4N6UbClY5d+Ufzftyxuc3y9ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
	b=20rIdhbe75u1bLm8NHN1neazOMtAA9/Z7gLndAlucZG7NlXSVGyCb/sGmJcsatYvaq8M
	 ZohFoyyi7VgsBScaIb490sWIuBDKPFrI8b+uhIpCsCc7V7u/D8ygN89T/s+Yqp6kmwncY
	 gvo62sn4DLFJNDryjmU+yIOilSdBOeXEVI7lz3YH/zITEGPPbYS0V2R3OyjJThkVma/oE
	 zV5oFZFuuLS/tJtG/sBS0PwJClu3OPBJapJttp74muX/i+zgbiIT4nykSVbilMt+5/w6B
	 cmCpwGqlj5I9zlL+qbG/WcudqUD9ZFNKW0jCrZXcd9Yd0CPwqltFeiGKskS9skKnMrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9RSEIGb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx5sbuqM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F6A606A336
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F6A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9RSEIGb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx5sbuqM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5x994063503
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGVXgr+T+Gl
	k6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=; b=f9RSEIGb3l6efg3ct1YubW/+Mbp
	E4BJtd+OgUBOIXCtz/BnPxff0NVNBXmlnMTQOSi+NFUpecTXNBJqz0qRRPrfBEcf
	6qvItVFESSaFmo0q86z35v2C0ByhPkrEuVYfXDouhkix91Ez65G2z3XshrVUef91
	WmBnb4Z8YEC9swgBq5FzGOAKVY5L+09/DmiadMe0ujltIXo9UyySieh/zrmkxfWU
	lAP1RJb+MFI6F5ArtWBCOUz5bG8iFysKfargUVPtnkgInNdLhin9ZVGNBMuJjNLp
	r9u7myBruqgM3xVjSW5MKdnOKApTIm7i4G+LsI6L1z0PCzjubOscoSM6iKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrcra8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:17:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so151513085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775870; x=1793380670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
        b=Tx5sbuqMNpXn+GOVdB6JfnicWv3IWZMrsuyfNSih9up6eqqqp8alYKI/HiJbZ/zzDF
         v8YEWLTDhj7+sd/YEMDhnP1Ew+Uw7S2ycbAbTMvGQApXyKKO2L2411pqrdGWk1jZ5TBj
         32gJz3EtlYyNNrqirj4RZ6gPz9CgwmOEK6xcKWV90dIVL+HcuR1O9HbLsS8cuIDmv1Qd
         1uamnmxuUxh0fuotR8Ub6CPZ3NXkwe7jCUtrPTDK44mKXOaxJ50X1qIHsoftrnXjbSRk
         10Txxr8x2BtOHrUCjl2+LPsTW99vQulfP8utTWBTS7I6BYHUpkyASN+0P4U0YwHO4I7C
         5suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775870; x=1793380670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
        b=zQdbqH1rm420x2BKNgOPEIhdhGrUxQdN/EobglXB/4bvqNoiVu59mqxPdrNA+WhcAc
         zgpUJYfmLEEWjScESAtWNMAyrYzwwUqWVzXjMvjnMVfRzIg2/iPo44IDIJX3lu3QCaY6
         zyJp90GcnY1x6YiEQyESQ+x/M/Z4imAVb7f9FiLkrviIr7NE1oxAwsbByTj+jpEATeqh
         yyI6LWHqhjyNsusRqFpKTfbEwcpor+wjYOnZ04BgMkOgK7qikri04M6BOVUTyhVGWEMY
         0ukADf7DDZApWhKGUJ6bJhg/1Ju8LAQycDXcAHRH28Wp6nWEsF0I6jS1pnxDbDdeH2cg
         ov5A==
X-Forwarded-Encrypted: i=1; AKwUvBw2SqeHhVNrRDHY9lgOOslvepa0brLbBuQP9IGOQDhw46pBm7YRtlxFHSAIaPHPYJbkXPjSB/eVtCe0StoM@vger.kernel.org
X-Gm-Message-State: AFq9FYJ11GUIEj2xn7n6fueMFoqehhNS1ydlsdGtCWelUaar0vnjCl3e
	hEVPz6xEKw05VTRaQVxyRrhWiZYWO60XX+3XKeWNckCahM2LQgUr/jJRD4734dRMT9z/ivKIEnW
	pWB40H3Bg5BBEuBMzLTUYgDftscVyocdYed/CodHFwcI29YnNftgDkfVTnm9MtMALxupr
X-Gm-Gg: AYBFou2TSjRM3EpZnzTCNQw6wiiNWJL/77H8hjRUEkLOJB7G/uxzgyz7paLWg54cbry
	cuhEC/CX21IPLMu26I/cbKWsyjtSMiG5hl6G8hjP2Zs0CGhqqxSUKOk/pTw2RdON85TPrv/OyZh
	Qf4Y9T91w0lpUigC9mJD4/Yng1wdoYx4nKxeZPctmSm09cg7oHynx5Aut0UVMq30fXM3qQIqjIX
	pTnOAoWSubJCUuLG73hp05uBXrLx+diums7laQpLKoWRC3SsUiCHnfC4AvJ+k2NYRiBtOHoiQlo
	lW52TG1zyqzt5R1e1uoIn0qxPTkYiUagWwfSg2Ag3dnbQHmsEh9StxN51gJhis3MAJR7Dj0e4Cf
	lHNoYimSloMeU
X-Received: by 2002:a05:620a:390c:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f6f954a00mr525152185a.44.1792775869522;
        Fri, 23 Oct 2026 10:17:49 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f6f954a00mr525147085a.44.1792775868977;
        Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 01/23] ASoC: soc-core: allow default ch_maps on links with more than 8 DAIs
Date: Fri, 23 Oct 2026 18:14:11 +0100
Message-ID: <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: xw3N0pqHlRV1TWw9Xeaydjcs-Cpu7I2t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1uE1QoLVuBLZ
 PKfX1Jl/oo+MHFrmLbBlQ1xlstWXlYcxMGJIp5SGot55O9GVliVQjrzD1GCMnDHJfXNj1KfbGPZ
 Z8mPpOJQjQ9pVrRAchUoCerGSvPPzvA=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb96be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZoKOZlNiuk5k9p05MsAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4jia5Ql1GC6J
 k/3mB7uwKk5ly6HcmILEPwfK00U688cJI86lEz7dueeQoyVO9l1XlVFL4P+kNaRsntPNtX6d3Fo
 0K2WwIsl1ozeQLMLv+vPTSI35RBGh7qKTFieIh5qbw+nzRoH1dejEa/l5YWiE6PBAPYl1e/38sP
 WRyL0WvUHnOscWpxtGaJPfWD5fxKVaN7d29qwgoJux/7QeVcbJBl1ZMOOf0tgm2sN5U4oW54/sz
 xhkVOsP8OCLS4G49giXjOFx5nF0qx1sgOn4T4A1sWtG9RCMFH9+cWA9+NdQt2nc8zsJVzRVaC3Z
 csyl5ImCBmUZrCf9RGO6V3adCn0Nu03axcCTquWsLNgg29eOKJliEBjeeyOGmTrv+YXQbHs5mGY
 m3LXdstNggaya1FdcO+ZFfvrsbhyolQzv1MRKwZX98pBFHQU6y15a2b8lnbAsRcumPvR7yNsXyt
 LS9RnA/hNP69AHSRa6w==
X-Proofpoint-ORIG-GUID: xw3N0pqHlRV1TWw9Xeaydjcs-Cpu7I2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

snd_soc_compensate_channel_connection_map() builds the default channel
map from static 8-entry arrays and fails the card for links with more
DAIs. A speaker protection link carrying both the amplifier and the V/I
sense codec DAIs of four speakers has about sixteen.

Keep the static arrays for links that fit, and allocate a per-link map
with the same 1:1, 1:N or N:1 layout for those that do not.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 46 +++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 97269b4ee4ca..34d02a39de90 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -915,20 +915,40 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 	if (dai_link->ch_maps)
 		goto sanity_check;
 
-	/* check default map size */
-	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
-	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
-		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
-		return -EINVAL;
-	}
+	/*
+	 * Links wider than the static defaults get their own map. The N:M
+	 * check above leaves a single DAI on the shorter side, at index 0.
+	 */
+	if (dai_link->num_cpus   <= MAX_DEFAULT_CH_MAP_SIZE &&
+	    dai_link->num_codecs <= MAX_DEFAULT_CH_MAP_SIZE) {
+		if (dai_link->num_cpus == dai_link->num_codecs)
+			dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
+		else if (dai_link->num_cpus <  dai_link->num_codecs)
+			dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
+		else
+			dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+	} else {
+		int num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
 
-	/* Compensate missing map for ... */
-	if (dai_link->num_cpus == dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
-	else if (dai_link->num_cpus <  dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
-	else
-		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+		ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps),
+				       GFP_KERNEL);
+		if (!ch_maps)
+			return -ENOMEM;
+
+		if (dai_link->num_cpus == dai_link->num_codecs) {
+			for (i = 0; i < num_maps; i++) {
+				ch_maps[i].cpu   = i;
+				ch_maps[i].codec = i;
+			}
+		} else if (dai_link->num_cpus <  dai_link->num_codecs) {
+			for (i = 0; i < num_maps; i++)
+				ch_maps[i].codec = i;	/* cpu stays 0 */
+		} else {
+			for (i = 0; i < num_maps; i++)
+				ch_maps[i].cpu = i;	/* codec stays 0 */
+		}
+		dai_link->ch_maps = ch_maps;
+	}
 
 sanity_check:
 	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
-- 
2.47.3


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364094;
	b=SyND2y7SzDqTkMYW7O2nmOJITkQBL1CD61w+kTxWVAsNtY/qW5bLKPVv+9v3kZD4+ZL8
	 +2kcZwih/jvjPjw102vTXYQPgVI9/lq5JhdXF8KiJWN7Nagr97trY3aq8tg3nQoqEBGh8
	 XQYIR0s/dKe/ESHirAoYhiOpwxRidiyBVxsZQ5hNfWfk8yLs1rMdlnaowUOYlmwIBQinu
	 AVFyXm9LM6PmVHB2u1/e4T34sSgzqS27LAVjGDdtT1GbWVlW+qfXDZodrQctuRWGpLLru
	 /ZdcQZGMI+HjK1OsKY/1uZR93A/bqkIHwsCH2qSoC98ISgQo5APd0ei0rAaTp4UP4Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a8VlH3z4mHpuuzsiY+CNzQ4V7ZtMtsMQjZ3c7RXsaWk=;
	b=ZM+S/7dLMWatrK5ecPHxr8LXWqxIV3q/iO9sdLQE4alMbtZw+9lA2ozinDTnHdkytTNv
	 x47tkzy+y/WUM5kGph5kjw1GXp/v4Yxyno4uBs75bRB+dW+k5gAWZRJbBhxoDlN/kW3TD
	 pjylFR4p1TwuTOOpSNHwukKwEZj5pOthZB5t96uIB+iC4t1hDTqq2ElS1j9bs062Xj0SP
	 8s8Hi5mTLz/WjAbztVfGSXZBQNLYQAI84qadTUxAOqUw2GbUi0qX2KUk0+xTeGXCYzgIi
	 x/RYxTQgGNvR2/P6Ig0Dj2OZ0Gh6fg8YFdPQbWTg3AvCyLJG3TtXOGQZ9CnZ0Shn6Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq64RggO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OerYIfoA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC733606A33F
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC733606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq64RggO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OerYIfoA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQHZq279411
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a8VlH3z4mHp
	uuzsiY+CNzQ4V7ZtMtsMQjZ3c7RXsaWk=; b=dq64RggOcJRrUCDVdafSZB9zmA5
	NVyjg120Tyh6j/MWLvHP7SGv1Izddk9liUBUNmCeR4kWn7LMJY1byvP3+MoexFzl
	ibivtyv4rsrQuO3k6Ygu1dS/fPlHok6d4yV+SnvM36h4qtffItGkPJ9zQVC2VHqd
	LqyjvpIgmMgeB8sX/1+zGrEBpS7q/+HK7j42dLhB9PHUt0aIBGn4WMzsq85ZZ36Z
	s0i6mQjOHdgTXfzJBZcd90XYDvU+oZjhR+wtR60IwHKZwLbKQUh0hOLw4GmC1+Wv
	nEKt9vZaPJP23OA0AgCsm+MDGQJevUZk0XxBhZuOY2JZyXgcR71ec+QBQyA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6ktd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92137a721c7so42780626d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364091; x=1795968891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a8VlH3z4mHpuuzsiY+CNzQ4V7ZtMtsMQjZ3c7RXsaWk=;
        b=OerYIfoA0Qu+IVHy6Pw7uNi2600Vv2xB5ybktxklW8a3U+NazGKCs7N690iuJTDJta
         Pt69WPlRgGOGPursec/WQMZFirHupfWhD1nyF0ZWI5nRj/k+nq0QIQgyWMJr1xAcZ9sb
         8lZKpH5dh0VRnU3EjBZFoQHnMXIB+qq4RRwleERNqHQSu5Oa68BJmo7/fZ6wO4FabcRV
         0j8PgWWPVwvu34UmZQSWPlAEEA2pOqATcl1zwtl8/e5M8AseT8uEi8F3HO/Ymfy6YxLi
         ODSLF8iOpavswXQY2EWwB/9b5HbGLx/L2iDUD2UulAp7ckh4ny0zKhT4ouAaItZ0K3ye
         vXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364091; x=1795968891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a8VlH3z4mHpuuzsiY+CNzQ4V7ZtMtsMQjZ3c7RXsaWk=;
        b=h3r/+y3sNwe+uHDS1O7RBSHgetn4mPacjVOq4cCPF6cnjqGtxMSVZUJkkfXIcN8awa
         CIBfV2IlwJwGyop/Vccp4Ky4E+12KrleY4bqfx+Ian/9J6Necm4+qRswTvm5n6LG63mL
         PmjBFWgoDuf+2sG8d4Z19bhRyYGyNRGk5Y8KMdFPKfBJGfBluw+BpCUP2BvoYtj5tLGi
         2aCVHazggdvvt6MrOfHtCNuDTStjVPpR35p845a5xtojwF7fjVsMCXZcY5BsQ/H+bgd4
         s2Nkuqv6QDgmBBM5UCkdC7nTp7RrJwpbKfhD+6eooJE5KdaiXEtUBVhPrLGh2jSazrlS
         HaLA==
X-Forwarded-Encrypted: i=1; AL+hErE1F/ngcUWUekH1Z7b9KI/VTzc3cgOGLz6TaERAAcDfHjci1XShgyovYHna7lNgOL43XF4qbJX9Ymul9uY7@vger.kernel.org
X-Gm-Message-State: APuU4Z+LHCRXppOs23UzaOdQJYBPRrD0c6suP2qhgjH/qIEkXKlbRJQG
	iqjVmeYPjUDD0H0ypV313rev9ZSVXbr9WUFrVZCsEUk730hq0OasoJv6ohvAq7ijw93O+GoGz14
	EamPKEh+tKoB/VIkHP/mpzDfBmKryGK9LaoOIl9T9i2n/Ll0Xoz67M3TcPPLA3D+rCGDc
X-Gm-Gg: AZFdTZfOEN+Xp4shYC9nP2XexGMOjzDySMXECuIes0XbNZ7BZa1m/iKxprxNzsOg5k9
	mk9VFkwe1EHbTV/FjvAahIra6KFejAhoVU0hg+EwxVyMaHJ1t0ZV6AIZIsLrWAgz12kUaeQfNGz
	/Cg0vlh3LBjQXkFH1zofowzQu4Tr11AWLf2veXVwP/xJM+TOObro4Wtice9rNh3/vCjL6gU5LGg
	5cYUmVCYCoH811WFwQHgeSGMzgET/+z+yV0p8KY97tbayXdqlFE1B2aR6SyoCQ+8gV0losfrqef
	K1gtVKaer4DiHp0cRJcqRgOqYSaCMsFe4Vnd421hT1bc4fAEVtNA0he1tWW2ZaW1x0JQXS/qVSd
	PTv19YC9Gc8sIOOx0v/AyyN+akcEwarEYRvpYNH7daPBHTAiR86ng/1+qWFYmLdrC
X-Received: by 2002:a05:620a:1307:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-949ba9db70bmr1502846385a.46.1795364091099;
        Sun, 22 Nov 2026 08:14:51 -0800 (PST)
X-Received: by 2002:a05:620a:1307:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-949ba9db70bmr1502842285a.46.1795364090576;
        Sun, 22 Nov 2026 08:14:50 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:49 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 01/24] ASoC: soc-core: always allocate default ch_maps
Date: Sun, 22 Nov 2026 16:14:14 +0000
Message-ID: <20261122161437.5994-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: AsFV7Ynrbmexd4VbiqidRC2WOcZ-bPjA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX4r4/QtdtOias
 QV1b3p8btm7+SauMP+2b1+k24m82Mnz/jgrSiswmpwm5ZsyxtPwI8j0riuTMH50tvMuCFZjIdr2
 UB9IFtF1X209WnfrVIw+BgsMNhdeq98=
X-Proofpoint-ORIG-GUID: AsFV7Ynrbmexd4VbiqidRC2WOcZ-bPjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7Bs85s8hGHh8
 NPmTUjJrGSjzLKCvhKZs1Pcn448FeWefdytMdf4k2Vf833dW2x6GuNG2QjxVxWeXOLVn1eH0ELe
 LWFtC0mHwit9nVgu/p3kkUTYo0xoqyhCRVNUEvMkfuD09m3QzsMKlhQ+Gd6vQR4ZFLtYgKYCRNJ
 8B6roHJe5UR2ZMMJN4eDzJYqjrER8Mg7eYmRuo2Gnm6UYCf3TXOK4h/XzMTdNzLwqCl/OMToIsz
 0UmnT/Fyretnk5aUzK+ScDftTwfTB2IWs2d1m/ZwZjw64sDCK5fFFGlXbqJTpgWamtAy1fJu2bB
 hwehv2ZlRzfzQne1FCbITqnonyAtK6hUw6ZGFjpzf+2THgJ2foBNKQSlTgPrQAodK7DqEDn44d7
 Nq9LrpfulRfxI1qMJkre5Wwte9rHCa/9lFGS/fIESZEyoNVR4AVolLdB6HWu+Eq0DEPhD73j0sp
 nw6zm2FbbF6l7UD+xHQ==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b0314fb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4_3eo341WbAlbDCHFrgA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

The default ch_maps come from three file-scope static tables of twelve
entries each, and links wider than twelve DAIs are rejected up front.
The cap is arbitrary -- the tables encode "cpu = i" or "codec = i",
information soc-core can synthesize at bind time for any link width.

Replace the static tables with a devm allocation on card->dev sized
to the link, and drop the MAX_DEFAULT_CH_MAP_SIZE check.

The devm buffer's lifetime matches the card bind, but the pointer is
stored in dai_link->ch_maps -- and machine drivers commonly declare
dai_link as file-scope static storage, so a bare write would survive
into the next bind as a dangling pointer, and the "dai_link already
has ch_maps" fast path at the top of this function would then reuse
freed memory.

Register a devm release action that clears dai_link->ch_maps. devres
unwinds LIFO, so the action fires before the buffer is freed; on
rebind the static storage is already NULL and the normal allocation
path runs cleanly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 101 +++++++++++++++----------------------------
 1 file changed, 36 insertions(+), 65 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7dfd79b4ca3e..ccd1cb5ee673 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -766,63 +766,20 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return -EINVAL;
 }
 
-#define MAX_DEFAULT_CH_MAP_SIZE 12
-static struct snd_soc_dai_link_ch_map default_ch_map_sync[MAX_DEFAULT_CH_MAP_SIZE] = {
-	{ .cpu = 0, .codec = 0 },
-	{ .cpu = 1, .codec = 1 },
-	{ .cpu = 2, .codec = 2 },
-	{ .cpu = 3, .codec = 3 },
-	{ .cpu = 4, .codec = 4 },
-	{ .cpu = 5, .codec = 5 },
-	{ .cpu = 6, .codec = 6 },
-	{ .cpu = 7, .codec = 7 },
-	{ .cpu = 8, .codec = 8 },
-	{ .cpu = 9, .codec = 9 },
-	{ .cpu = 10, .codec = 10 },
-	{ .cpu = 11, .codec = 11 },
-};
-static struct snd_soc_dai_link_ch_map default_ch_map_1cpu[MAX_DEFAULT_CH_MAP_SIZE] = {
-	{ .cpu = 0, .codec = 0 },
-	{ .cpu = 0, .codec = 1 },
-	{ .cpu = 0, .codec = 2 },
-	{ .cpu = 0, .codec = 3 },
-	{ .cpu = 0, .codec = 4 },
-	{ .cpu = 0, .codec = 5 },
-	{ .cpu = 0, .codec = 6 },
-	{ .cpu = 0, .codec = 7 },
-	{ .cpu = 0, .codec = 8 },
-	{ .cpu = 0, .codec = 9 },
-	{ .cpu = 0, .codec = 10 },
-	{ .cpu = 0, .codec = 11 },
-};
-static struct snd_soc_dai_link_ch_map default_ch_map_1codec[MAX_DEFAULT_CH_MAP_SIZE] = {
-	{ .cpu = 0, .codec = 0 },
-	{ .cpu = 1, .codec = 0 },
-	{ .cpu = 2, .codec = 0 },
-	{ .cpu = 3, .codec = 0 },
-	{ .cpu = 4, .codec = 0 },
-	{ .cpu = 5, .codec = 0 },
-	{ .cpu = 6, .codec = 0 },
-	{ .cpu = 7, .codec = 0 },
-	{ .cpu = 8, .codec = 0 },
-	{ .cpu = 9, .codec = 0 },
-	{ .cpu = 10, .codec = 0 },
-	{ .cpu = 11, .codec = 0 },
-};
+static void snd_soc_clear_ch_maps(void *data)
+{
+	struct snd_soc_dai_link *dai_link = data;
+
+	dai_link->ch_maps = NULL;
+}
+
 static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 						     struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_dai_link_ch_map *ch_maps;
-	int i;
-
-	/*
-	 * dai_link->ch_maps indicates how CPU/Codec are connected.
-	 * It will be a map seen from a larger number of DAI.
-	 * see
-	 *	soc.h :: [dai_link->ch_maps Image sample]
-	 */
+	int i, num_maps, ret;
 
-	/* it should have ch_maps if connection was N:M */
+	/* N:M connections must be described by the machine driver */
 	if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
 	    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
 		dev_err(card->dev, "need to have ch_maps when N:M connection (%s)",
@@ -830,24 +787,38 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 		return -EINVAL;
 	}
 
-	/* do nothing if it has own maps */
 	if (dai_link->ch_maps)
 		goto sanity_check;
 
-	/* check default map size */
-	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
-	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
-		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
-		return -EINVAL;
+	/*
+	 * No ch_maps provided: synthesize the default 1:1, 1:N or N:1 map.
+	 * The N:M case was rejected above, so one side is always 1 here.
+	 *
+	 * Scrub dai_link->ch_maps on devm release so a static machine-driver
+	 * dai_link does not carry a stale pointer into the next bind.
+	 */
+	num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
+	ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps), GFP_KERNEL);
+	if (!ch_maps)
+		return -ENOMEM;
+
+	if (dai_link->num_cpus == dai_link->num_codecs) {
+		for (i = 0; i < num_maps; i++) {
+			ch_maps[i].cpu   = i;
+			ch_maps[i].codec = i;
+		}
+	} else if (dai_link->num_cpus < dai_link->num_codecs) {
+		for (i = 0; i < num_maps; i++)
+			ch_maps[i].codec = i;	/* cpu stays 0 */
+	} else {
+		for (i = 0; i < num_maps; i++)
+			ch_maps[i].cpu = i;	/* codec stays 0 */
 	}
 
-	/* Compensate missing map for ... */
-	if (dai_link->num_cpus == dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
-	else if (dai_link->num_cpus <  dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
-	else
-		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+	dai_link->ch_maps = ch_maps;
+	ret = devm_add_action_or_reset(card->dev, snd_soc_clear_ch_maps, dai_link);
+	if (ret)
+		return ret;
 
 sanity_check:
 	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
-- 
2.53.0


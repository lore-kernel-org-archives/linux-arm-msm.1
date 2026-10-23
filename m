Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775625;
	b=okqyzIor/zSqWpV0p2esEcml/63uMMVJAm4rTo2lYo3MqeZGyeeQzZO3XnXRB1N8L9FT
	 JhG5iDVpAAiOVOCwYqzFiO0M9S71zCrnvlWicV1o6IKtcaFdWzSylcvCU+oWXlmoeMAD9
	 /7NFxao3z2jhYY4gXfSSHb3+KeBuMe7GBjp1SyXD5AVW+/pg2alPjO8DveP9T3n5l90l7
	 TSCeA8gr+xnROtPpUXb8L9bjx54S1Ai3o+V3Wi+KfQQ2iTTs87SvUnXcyOYMHs1yx72jh
	 arElc5gBse28gw3xgtWBMgobtslS0TICJlmE65lx79bmwI/2Qa8+BJ0VphBYdNyqQUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q7CjwrJ57Uxft8mucUIc/DikdBIKR1vUoHFHQH37p7I=;
	b=Jxd5H54woA7ArWOAjEtLiXFxP4nK+OkVWQSpdBw7cZ4WfHF72ym/licqaZsQGjgkM7Fh
	 dHjb07lkaSwL6ReOZhcz4b/svxeFZq5nRo3kxGZRSMUT2itZgF/mqeKt1wAz3jzizE+/Q
	 KJ+vcAPGPoULJiNW87jJoxDNVhyaUjpCGnr2KtosG+1+rv8Ssj++NcFyfR3j76PaxTISu
	 FrGxNzw1B9phRn//XOM5GaugVGhgAfFGJQrHXzhUR39bIxtgUvHVrJHg+tRsSW0LSjjeB
	 v7VVonZ999oEf3QXJZcS7M78FvrHQxph7eD/3lfWyApgAMRTaCFl5j6JnFzwUawsj7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7L4SK1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mu2TudLt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCACC606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCACC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7L4SK1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mu2TudLt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG2vVH3733905
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q7CjwrJ57Ux
	ft8mucUIc/DikdBIKR1vUoHFHQH37p7I=; b=bh7L4SK1crVSQ6iTSKD6MHT394T
	QC/tYml693U6boFdRL9jMD/RLnScMtr/+6TL8aJeSnt6WgjkCx4caeW52c6SyPjw
	QIxs2QznkN67RMMoqQiv27lwo85yJdd/x4pK31mK/rxT3JzcroSyhqydCkUi1oz/
	38A4OUZ3rcMOyXhPZwKWD+t5/LfsKp+OV5yF59Nc4M6nURRdYKp5Xv+89V+znZtG
	iB6PGZLsCZxqq5cqoEFMtKxW7I/eg6USwpeEkA8YmmzIfTGUrYN0p+m5LvxprlCv
	7eeWRncT35Aw5IgN9QkoLKZcfz8wbHjhZ8SuiNyY8tM26/H+e/xGji3Cw7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug8vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso191570985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775623; x=1793380423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7CjwrJ57Uxft8mucUIc/DikdBIKR1vUoHFHQH37p7I=;
        b=Mu2TudLtfAqRCKDhf+dDxfKn7WKIWVZdALD/brqlrUX4YMzWrhF8k0AkPC2oNl7DyT
         HlKQLmJwTF1FQ7dPRlNE+2Fa8a2PlXKRldAcLU0Eo8srxeHxBCStK97BQ581FmJ401Fy
         4VJz8aV9swA/vFtSTior6kqU3aLhL0a9pL1DCixz64JviL3L44AI7hLgwXW8WwRp8igT
         cM840ZyI0dPbsQH58DYoXJ++NgFo3pFYEtlzWWYYE7LJRFphdwsR73fKAuUdmx0shzNG
         oRFzans6A46JMvifyufuTBFHaD73p7KRGHU6kn+XrcglTA0IG/gRjvZrAB6N7kEmx1oY
         T2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775623; x=1793380423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7CjwrJ57Uxft8mucUIc/DikdBIKR1vUoHFHQH37p7I=;
        b=ExLmvlFRqqv6VA1RgLqe9avqDskbQvvAVZNS4KRDpIfkvQ3hXTA0BfRXR+aA8joGMI
         Cjpp3ibLI0dNH3Q7tWb8rOQ2lqDKGtAmcA9iwjvl7HTpNGTCJrs7mxahtZLVyE4uZrq/
         aWUS1BbemJBbRL9ruInMoNf2mHdsFOJ5v+5b9PL68l4FRE5RMVE9LdyeVDe6jjQBB/+d
         wer/+kINLSDTEcaDA3x+nBfDuGmiFWYcUWYLd0GUb4+QkkHnuwFP1i1SAxY2o+5KAY9T
         5kwWlwulBgKmg8NuKbFWsSS66fnBIw+N4Lxskvj8CjS+7HTN8Mgk1SioZ1owGuf0fLFA
         hNVg==
X-Forwarded-Encrypted: i=1; AKwUvByvMJ7asQ6VH2AVoH0iY7ox/eXYBc/CFRwH9eX4t9mmcODlhG2TQjpmbf2mq5FjO55Pwmdjoc74vHgPXl64@vger.kernel.org
X-Gm-Message-State: AFq9FYIANrF/9ls5SqjQoPETRDdORVH68/r1GcMY6+faVYAF4e63lTCS
	7ie3ZANVrVl6HmOcAZkRA+ujxRi28boYZMbA46iHCHB7BN4tC+hU4KZFo8XUKGrw51Dkk7ax8iE
	JXcOYi0GMvZs6wAe+5ohd+8ts/DlAbElcv5PjUun/ES2Jo5t6glT9BmgvgktMMXiYrZco
X-Gm-Gg: AYBFou0VhygUDnoNeqw34rWEKFNfXKnHekWu2ZX42fR+dpnlr3jtYuab6mHThhvXgrX
	apUqurJ1JAgRtTQfX19RQoq5W87ziPE6q/ALhaMRRtqRzXtnZExL6NsVbdH2paDXyQ+LAAkdVXO
	koQaT8zUvo5KPD9++QWBSkmENm+3dMMSTkh4Bjy2+jYM6dO2NqJGRUWRAG6/rlz5WmUp0oIPhct
	xTC0BjGiBuMyGlFQptHBv4AU/915/DV39NJN/zo2yTCCBnSqPRfzjTy6RTzpToxHzcpRypgd12I
	89CDwrv9iEeIInts49VErinJVfxJU/KqHeXe6/+UBpsfn5NTEi4Xg9jzxZiafeGzOgjgfW3DJR4
	uybDWTYUEgzq5
X-Received: by 2002:a05:620a:6601:b0:93e:5fbf:a41c with SMTP id af79cd13be357-93f6f7871d1mr471331585a.16.1792775622969;
        Fri, 23 Oct 2026 10:13:42 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:5fbf:a41c with SMTP id af79cd13be357-93f6f7871d1mr471325885a.16.1792775622434;
        Fri, 23 Oct 2026 10:13:42 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] ASoC: codecs: wsa884x: Fix VI sense port channel count
Date: Fri, 23 Oct 2026 18:13:15 +0100
Message-ID: <20261023171316.819857-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX07NNDZ1lwk0Q
 kXUjLQGGxB4JvRGS+IstliRJymnKbBS/I7D/OzO3IZCpSsyQYtin1rhN5xDdawYZrrbTHhHJOpG
 Tc4hTM/UAIXPFcn4Jg7fSDc25ghbQKY=
X-Proofpoint-GUID: _ltUcZX7qGDQRm8lEYDjS77QiBHfrnoZ
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb95c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=nTjqRRZ-t28jT2G9NSIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _ltUcZX7qGDQRm8lEYDjS77QiBHfrnoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4Zc31IhLN1pU
 JgQjnM/hib2cMxl+HlexRbNGzVijTrsYbc+tR1nD3PzLzkCom34Ybh0d09eKkUxJPKvuFYz/6O1
 Ihj+tg21ATZcL1iJ1jOM7KEI1nnDTToXsLq20pgJMxj5Wzv/e7VrSbPaMUn3R3UU76+iWS0hOVD
 ZZ+B9wxOcNeN8VmHec3xZorIE1no6iZfzFeDKyqclf9X3kGRcCnDM+gJDbCm2G+jYu8jr4AjVbd
 Ztv0c7qfDEZvZo8tnaxppR3AHMJjgAzQj6ipBeQt3amiGx6hURoubSGZVa62qZpGg4unZ2A4KRx
 H1sNzXmgB8K3iKZFm7kCMeX7i+Rsh91hebQswKrmg76lBfy6Rfa3NZkODzFFpZaw3NTlnguUDAS
 UUAmJXAHtToM4VagqzwZPCWL4oYs4b+DzHTMH9uUrMIrX0olEzi54rrGJMJ4Ea3vWZoQbGvt6U0
 bAXjs55JmoKLtwtr6dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries both the voltage and the current sense data
of the speaker, but it is described with max_ch = 1 and, since commit
060fac202eb8 ("ASoC: codecs: wsa884x: Correct VI sense channel mask"),
a channel mask of 0x1, so only half of the V/I pair is transferred.

Describe the port as two channels and set the channel mask back to 0x3.

Fixes: 060fac202eb8 ("ASoC: codecs: wsa884x: Correct VI sense channel mask")
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 3c008224d32e..acf32af5aae3 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -859,7 +859,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.num = WSA884X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
@@ -892,7 +892,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
-		.ch_mask = 0x1,
+		.ch_mask = 0x3,
 	},
 	[WSA884X_PORT_CPS] = {
 		.num = WSA884X_PORT_CPS + 1,
-- 
2.47.3


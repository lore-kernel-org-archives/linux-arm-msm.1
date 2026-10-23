Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775618;
	b=WetugIsGY5lU/jSU0p4PK9yLt0znbR3jGJcJ6Y2YHuG2CE7eKUMJ75RcT93n+e0a9NfR
	 wTEvtVRrYHRpiwUmVirq3F+EGOvtn2WLmid04nHcDCS0XjRnN0Ol9+8KZ96pr1OkunQvu
	 A1IRS9jh4hsIc+5l2AJeybF7Drm7IqOQjMzteciUFawAcg3aR94+7B+3uciKi+sRXju4N
	 deWMYHr0TfGY/3Cm2mrIDcZPN62bE/FkVDYKkF/8ro9YqRo/qZ1ANrhuCXoHOjmhObqjC
	 kRD33xtXkdsEsQXhp/3UnAw2vVIVYc3VbidSEhin/qXls9GYw4K9aH5+z/xehDQNjuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWvAd659eCE=;
	b=1E6JlQZk5knGuYx9X/4BTIUzJdu6vXKZ1H67XJdaED/tLbawpCXiiHUMEh6igfG+vZLX
	 EV9+M5eKVgvV7K0TO5bKlZLBz5KpzYzIRtrICqhOy4xzfVy92trgOqgb9pkN/4JYoYZxG
	 C0eYN3dMAWhjsNS47OSMQU5qq9uPpn0+5kWvT0xE357bP6aZ1gUcjaU3wWvqe8EkSDFIB
	 EodsuxrLKsyzOcn6aGhS8DMHMCW+cDopUukIMnULvNQ4NDR6rsqBtCMNU0YdnBwpemHvj
	 U0LO9Gj2rjFzFqwsBgPDY3s/ayOG/YCmh7CVTdmYPPt2RpsMxu3YZzFtBzLd5GFfZEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DiRTT/9r";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IxYuVicj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43927606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43927606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DiRTT/9r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IxYuVicj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3nCj3811866
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWv
	Ad659eCE=; b=DiRTT/9rC9jF3og6bW5vdTTBFKFT0N2RlPAn4SJRXS5Lh/Z78ID
	DVkuxm42xTrgUacl4kTlnpXEJpXVNUNVvPHsvWDSw+a5ppgz4FR4oagPu0QfyoDb
	xkvMbsk9ATu761kyOvP3DTiQapl2XiqzTKssijE1gTKUuOUFTFg176edY1/qgpxl
	fxERIkU/VO6AlSQ/YXdCZx8hPlHUav1M41K+3wx3McdlD/3xrpJc1WsGH6dDorhx
	eXeQt7+r9kFWrECAZZO/0giAokfcUPON9Ou4LffhQfjxjhUwYq6lZyQAGChCNdpf
	PJnxyRJA07JUo4oZ+/5deGDqyZ7CyP+hIIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas888jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:13:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso242516285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775610; x=1793380410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWvAd659eCE=;
        b=IxYuVicjOjbLSyDIn4pw/XgHL+hsyZ7ne0xrjPoD5wkLzvU5sChhFyUFGbZTDRc9sX
         uRhkn30jaVoWNGXkP21YXCaolPKlLcieQo35Y+uhroDAombsA3sgWvL1Q4Mrsb43qCF1
         L7lM8ZrxEePgBnLW5dVNe/A1bw9XKkPaJRhQrxXxRyELILj2vrb70FssZNzsk/Nl8ks0
         9cgzPM9PDwRj8vxAdo8stxHa9kmC7n0upB9EzcHiLJldY1UyNLu1/Er42iPaJyeNOMhs
         giS+3GvdasddtiXYzBhigm45Iw5ESRBKZDBxvnkWOQGhNSxnoqQFrcyK4XMt6VSxmpGw
         b1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775610; x=1793380410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWvAd659eCE=;
        b=0rOJgpnC8YhAsy7RUIkPJrvaXpUhehFSrcqS2j63xuciVB+gg/DAN3BkRUxhOyOYog
         MO1rE53tzM4ZnqNGfmIw+LkC8e45xn/iDw0l5IC89XnO1yb30MAWdwWWUp2gk6uB4x7H
         ChZC090+xlSS6dEvNxpgg2f00qNPJO3nT0/8dmOcNnyWMhqRJ0mnGGrZMZeG2T0ayelf
         1jEP+PISZ/sI2I3aQFhLF3JlRs/DoCE1BpJJRoTNX+K0ZWSzGtJU5jOufJVavapDmulu
         iJSp2OgcoyDSh/NUD3MKJFLljcgLJ7oOd5qyNW05dgvB31M/r9VjQ0DcHDwRtZA2ZxVb
         zoCw==
X-Forwarded-Encrypted: i=1; AKwUvBxRBrmbDYH7lhhwJ6KovvzW02hm4M76A7GUouQK8Qx1jPe0LFGugaQv3bBy6bn6/fgpNUFIWAg9+Vp2n07V@vger.kernel.org
X-Gm-Message-State: AFq9FYIn/c0eTUrMkkJcZXUDKnx++Ej+KUG9eRdNQa8OlRaJWPMbIsRX
	LcX1iubYTmv09mix2t0/cRRRqeioAApGZIDV7+M2P+mZe9mG5sz7jzJPdIsEz82nU7WZZTWoQvi
	EeV/Ncc00U5m9ZforHXFordNcqwNOh89DTZyBNYhlhnPZxp6b/fXHJyj6P1MGwACLwG9h
X-Gm-Gg: AYBFou25nYu5xrqaf1cCLpr6pbBXZwXTWkU/RPuwdiqrE3HhQLSNH5wcgrkUGzOb092
	F8qzeg29/myfTva1/wHTNpzffKOfI7P6+64bkw8F3Ze7OEBIwOnCAMs7Dxbtkbpa6TbXlIVfRmf
	DzV8Y1DQKMXe0N7ojkrxBP99c/HUizANXxR3c0F2L7xgA7ojD3FWH8MbWgYtuWOFzoert4K2xKZ
	q5J4AeBmWpSh6M6gn2vNWhIYY6N9m2qIjJfEM93OpnDlp7yoa8qL+l5VHPsZ7P6lkdP7B+spqee
	vDP6vFVyQDLgqMPYn2SMYH5svvf0aYnIGbQQIXBJNMvOQLhO3e3VNuw624Smiud21M2vOeDvBWn
	4mTuCX5/Z3/CQ
X-Received: by 2002:a05:620a:1d09:b0:93e:9292:1b9e with SMTP id af79cd13be357-93f6f570994mr507406285a.1.1792775610405;
        Fri, 23 Oct 2026 10:13:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93e:9292:1b9e with SMTP id af79cd13be357-93f6f570994mr507398685a.1.1792775609670;
        Fri, 23 Oct 2026 10:13:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/7] ASoC: qcom: AudioReach and WSA88xx fixes
Date: Fri, 23 Oct 2026 18:13:09 +0100
Message-ID: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8HHjeY5F/kGU
 lDdL/JRYHTD4ZZhHiXfx5CDntNUKgembObV/nuP0tU456KTxnDfamWsJATMw8SWdxPPf59iKvAK
 tB9UJE+tjen0MF3OGA1orp6rCJgyMeA=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adb95c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VY0Mi7k9gUTMOwSAwkAA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX0t1piNtlDsvy
 OyN00pmroCTo8PccSQiL1i8Lw8euQiiYAc0QIbiTrS9zkpn6qPk++ekhcCBAesWeulmbrLiToEH
 +x3Ps09iPMRJ2MfrI7zJz2s9TdFXAaNY6tkDyq1nk9s8R01WgpgUDBw4duLlgAr/88S4JaaPmoo
 aOq1CYgX/RxZN50vQP7Q/Xbc2jqxCenyw1+0k/s55j/4niyNev2QYvGrj/0XtapPnn10zX9DjcP
 4Z9ysOG1CEt3Xne6jriF5HJI4+S9OKGf4RuTDom6Y0OY4Sdkfa1MygPtJyjGkbYuIUcD/KQQyXB
 t4Mb6mn1iMGX2PrIbs5NcSJp2VzqA3nFdqC8700kxXFwEv6b3BJFkz6TuuztaI+uPgFFzIuHq/W
 X0vhGdPpULyxOV1CZqzDBE18qaYEaIy3oq7Qk3K2aO98iaytViTmfMM8CSbIgP9ImrMMWkiaBPZ
 GWwXuTYEYXGgwRXlNcA==
X-Proofpoint-GUID: yWmGr4D5_AMn0umtMMmmypMQ2rZh7sOI
X-Proofpoint-ORIG-GUID: yWmGr4D5_AMn0umtMMmmypMQ2rZh7sOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Fixes found while bringing up speaker protection on the Lenovo ThinkPad
T14s Gen 7 (Snapdragon X2 Elite) with WSA8845 speakers.

 - AudioReach: the module cfg blob size was used as an element count,
   so the allocation and copy were four times too large.
 - WSA88xx: speaker temperatures above 45 degC were rejected, runtime
   PM was left enabled on unbind (NULL dereference on wsa884x), and
   the VI sense port carried only half of the V/I pair.

Tool use: an LLM coding assistant (Claude Code with Claude Opus) was
used for some of the patches in this series, to debug the issues during
bring-up and to draft the code and commit messages.

Based on next-20261022.

Ravi Hothi (3):
  ASoC: qcom: audioreach: fix module cfg blob size handling
  ASoC: codecs: wsa884x: Fix VI sense port channel count
  ASoC: codecs: wsa883x: Fix VI sense port channel count

Srinivas Kandagatla (4):
  ASoC: codecs: wsa884x: Accept temperatures across the full trim range
  ASoC: codecs: wsa883x: Accept temperatures across the full trim range
  ASoC: codecs: wsa884x: disable runtime PM on unbind
  ASoC: codecs: wsa883x: disable runtime PM on unbind

 sound/soc/codecs/wsa883x.c      | 21 ++++++++++++---------
 sound/soc/codecs/wsa884x.c      | 19 +++++++++++--------
 sound/soc/qcom/qdsp6/topology.c | 31 ++++++++++++++++++++++++++-----
 3 files changed, 49 insertions(+), 22 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3


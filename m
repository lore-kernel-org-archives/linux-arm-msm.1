Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517867;
	b=S1X5Ef6I3aNWvXpXxehfyJHgYM3NnPXQWHur2B0oyz+1JkNLL9t0+dMEvlqq4Topnbx0
	 By03+eknOIzVOvfQOr7N77gdAR8RqHtjjnAP+wXhucX1BBoZ7ZOQgAUrsBuIqRzgUctAe
	 9UX3mfQQl3lPxLaGxRLYkoX+6AgDR+LYyBpPzphNAe4/jEe30lKeDbBy+iuiFGG8BA338
	 f94X6ENQPdzMm3HSZ9NhKdwHlwYrOvkVzwihF1+Tww86BRZE0X7f+PBCnTdGVoxqZq+vr
	 ZaCzG17LsPVLCJBB6VlndjEpda9gRNRnUVeAa8utrafmt47tLAMC/vArTxfVP5CsKGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nKDh+aiHhwLRJxbJgzkce4cKW63XH3hjbRLk5VxxrYg=;
	b=zILl/dsnC3OM91FB7tqBOiYyQf96Lj+ICvpWKIZ73+FvzC+GfoD8GZ/aZ2ri4UtOGwLO
	 U2mOTh7hgihyaz/jHPi3H/je0PfQHtm2m5Mxf6r9y86i9hRJp0TkHX5/wWHFuFl/AKcKY
	 8cuFmqiqIUFHTv38WNJmPq93nH4itVcXbnKlrCdHEFOJZ3SFxFgl10msSyD/AJEPfvUut
	 1XnNDnZ+VgLEhJ49hWV+vCWjiIyWl1b+zMKno0DvNiT9l38OQtqqZeFpsKn8YFnrrnSG7
	 V0YFWoc6gaky4M382hIKCxfd2ghASSY32NR8DQzGrhKTuMvOh3dBjPvCt3i2D6HXxZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNo5qCcY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGugjSLH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E425606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E425606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNo5qCcY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGugjSLH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuVnc1736766
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKDh+aiHhwLRJxbJgzkce4cKW63XH3hjbRLk5VxxrYg=; b=bNo5qCcYZEt3N5tA
	wKgr/nmUGakLTge6y3xFd3sgBdUj024ebQZgUxZGHBb6+6uK8INuA8C2Z0z6oI21
	Vz5gSrvOqpWDZSN3yZDUrLKEQ/uk27GdGSe08rfqQEuJFvdts/nOFruQHbdi0XTW
	3c/KgtbdOGJMQRvzkpGTOKTUJj90C3O0t8SRte6f4+ReH9SPVLjdIgTAK/hXOgGk
	8qEsLYDy5SU+mQ0xOEzQIkW7RZf59J4j8+hXgxIx77Tgu7+YXvk1a7u3bI2FUu4I
	RIOKxr/IY7hw/2YvS2oaYFnUZGT1E7OiMoHxkR7P4L1Ab/fE5HYahrRk5SJtcG4M
	kIJyLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2bba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:57:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so416875385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517865; x=1796122665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKDh+aiHhwLRJxbJgzkce4cKW63XH3hjbRLk5VxxrYg=;
        b=iGugjSLHDQgnBlT0h51BXWjk9RKCoX/DwrjK/Du9W1OHZNnilKvv5ms+WVVIGQtQj+
         +WEJdLgPbMBpJaWH4eAS34T5fQRmO4SQHC7JlwA8KT68LrrZs/SRMHTyCt9way8vKjHK
         8AnhY6kd6wxZHftdyU7dX8MGzgJa2aH/XdxsmDhHOa5IZq2SYe4zvdy/OkNAofKrYep9
         pSFGwtpEBFIKzKquKPvoH66Rf+peMaqTr0Tn9tq6ODZMgWYujyXYRYxf6086VSTBEyga
         3jaiGwaVcfIQtWVmL9uMopTdPvMF93Sh0IT6NbUHIELiPugEhGLe8TYwIz0pvxdcoN1W
         DM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517865; x=1796122665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKDh+aiHhwLRJxbJgzkce4cKW63XH3hjbRLk5VxxrYg=;
        b=HJbTLKwix1h1X/sHn+OYlrldKDZHsn3K1nTB+hf46iDp0n0EgE37xtdCRkhc3OE+5R
         E/1ndLBcHHVcGWamLy/7BPViwD/nh8+29YwZYlMCv4EzptUzFE1nwXvWmMHra2TE4v5I
         vXBMHLU+yV8aV5pHZ2E1q06Xdj8DkyWJz50OWbJqh6FPOsP1sthz2BaW6oCIEcPxiRJK
         9umg8jIZ6XLCwO3GMQCg9vlZN1R/S581N9xp9Tze5qJ60Rn7SUU/ZwkcobPXeCi4v7y8
         LfjWVYHMSeOlOGPTicf/Sn95w01ucYUyHtaPmDeXTJP8yiPWJBrkkKSVFm8/GIBhmRl8
         nE+w==
X-Forwarded-Encrypted: i=1; AL+hErEjfp3kLowGkpJVEft1lF2/XMvne/RFYxlnKSoK0tK4pCzHSUegwJ6FM82CriybqKlgzFZvtekAQftPDkxS@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jz1YLNW6EcTj1HGyvNf5TjTMhrA22M5EW/kTWFo6uMYvu6fUB
	sHAJUm13iquYOqEkkjKC05z65XAIGuaWWA27FlYLTwo0Grhmyh4HgDNV+igQ4bTTJqOb0sS41Cs
	durysZXqszrkqsrpwYtpB9pcOKAwtEa+v7yHeDJ/IIY5F6nO5TBSkhWpfvsgush75wluq
X-Gm-Gg: AZFdTZe9pqKRe5lB1HxAFsnJU/SJaBYG3LQspo03F1NVag378kOWCIeQsA6uDQLzPBc
	Xd9AMrOgVxPR9Pt8/1B6sRBQhXvzR4Wd+fLMWwAac7pW/+7Q6G7Azma8udhBkJWTvtr3wHXazDS
	HBWUJDNdv3ggdNMQm70OzvY+UA/BXLCDbVgEm2LKDnxMMZnar9iTOP4pBmXUFOLCME6dAJbwE/E
	0C5FdvXfP0ieYht41gP/lTUJzKdcdaoBy9GDgvxuNTBtDdvtqqa4f1pKpRpyn8rkiJXqKqQ93MS
	xU2TDU5+0lIwvF2TjH7MHjNUt+1jwARldedU5cF8r623uOqRngxM7HQJYUns9nyycAjHlYOm/PS
	Ig7d1IPyyUTa87/ogKEc4lqlcup+fFGTh8zr6HFiJEORfKM04gwHA1Si3
X-Received: by 2002:a05:620a:6485:b0:949:a71d:af14 with SMTP id af79cd13be357-949bab5548cmr2147016085a.66.1795517865023;
        Tue, 24 Nov 2026 02:57:45 -0800 (PST)
X-Received: by 2002:a05:620a:6485:b0:949:a71d:af14 with SMTP id af79cd13be357-949bab5548cmr2147012685a.66.1795517864291;
        Tue, 24 Nov 2026 02:57:44 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm612415085e9.11.2026.11.24.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:57:43 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:57:25 +0200
Subject: [PATCH v4 4/4] ASoC: qcom: x1e80100: Allow userspace WSA RX chmap
 override
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-4-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11341;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JeEUuw71O/ueq6EmmVo5j6gxlQlIXHB5x0gINrwlQIE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBW2fgEihT7gBHJcCw3Lnok3trzT4DAOAvK1LF
 h3jBFg0ndmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawVtnwAKCRAbX0TJAJUV
 VnXRD/9IJnYfhvXfFKNLUEyLNtYRA4YR94MJNoIlQiLxzh5KZxjaofEVuBEBB597/rjlLe7IGpv
 nX6AUeZGnHcLmAAXazvD+fzJFcXiOa0Ug3QjlIEZcEe63ndpDozYIMWZrXMWxTcNhud66GR2LrS
 1lo4sd7/lZ7YX+wZwqOPPwkt3rN06XtpxHMDhz38e1B0TsDtHjdiZiYps+zhCQpQ4LPrwVs01bC
 yhwHDK46lyzxktgOeD1hyQSPukjgzRpGC9KsM5Kr/rG3Sg2NTjDpPnlblA37opOhpbqMWbhgckK
 H1/k7L/s/7KUiuZHB4/aAL0iQ2rUC68A8H8PJEOsHRcVwZjf7fE63sMa9vFve4zj9oXt2hpNZD0
 xvSGPNwBtokRc8/Jd4PyK7j8MjoOGTaS4g5VZp4oKh71mWcKGKLSXAftHJDeAmLhIVvnY4D3yFp
 ntNTWb8Hlfd3p6lfibo7Jf2XZrAfkBj3ZCzPEzO+x9uzEvac3+4DQcSFFC8l6w7+o04/8zDIIw2
 qUFbKLDAimK6YPhhMRiWIfhksnG6H4tKUU5QCQDfODZRESdcjZhKhuXcTCvJj/ka2G4bH+Q5hA0
 a3PqMHPgyJHyk6dbf7H4u1xDgI5pRTqBb+xBlRFN4rmOsDNgqoWSmEvMqFUdvvOE3sWZihIN5Ab
 miqWd4EDVAmAieQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b056da9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gpi3i7521TmAPI1UOogA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX7/U0ABPF3/kR
 4Rkl3a2HJTI98Y4YoSJf7HjUD4v4/rpPMgyk2+tJbP6vmOF5jECiHWJQPcC69geqNbY5/sDdoz/
 Hv+3kdzP/Ra5pj5LTTF5wf+f+JUwgJnIxRC52A7+HwsshjnKHCTXtllS5BLVTJebgo3FChRgyUh
 BN/eUtlrXc98/+iu6FYg5dMuAhENIq8ZACtJbjpotJsf0ItPw/CnsWdiKyu81TIMq6t7EuZXyDz
 H5tya/TOvgoXP5b6d10Q0mlgC5jL+23dWkxrmeE9Nqebs4WWaWvmNpx12v+A78YziH/MmL+9E+Q
 eukeBDkNRqa/JKkNNJQoZ/rDMaq9QfOOvgCSkQq6kEn6Jaaky/K7JtfvI/GkMAAgqs2If3+o6Aq
 0chtt7moLejN8i2pQA9ymFEnALpBMsT+wRvpKTEiqdaqwE7KCWaS8teAeUEXzp2p2grWPhx9q2+
 5Q1HiImLZfnab6C37oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXw7TMgFK/M317
 sDO3ibMXnc+SCsQoZvArl1EyMI5p2LlHfkNoGp3dWz1dVCaPhZhzLts09DIQtKSa1tOY4EJgv7S
 4/Foy1fxzITtCcqVfrajxmOjnEhUeSA=
X-Proofpoint-ORIG-GUID: yzwSIvRo7ea5bXy283gZB1xSzXEWX8dy
X-Proofpoint-GUID: yzwSIvRo7ea5bXy283gZB1xSzXEWX8dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

The WSA RX slot mapping is currently computed entirely from the channel
count in .prepare() and pushed unconditionally via
snd_soc_dai_set_channel_map(). Userspace has no way to express a
different channel map, so any map defined in UCM is ignored.

Add writable "WSA Playback Channel Map" and "WSA2 Playback Channel Map"
controls on the WSA RX backend PCMs, using the standard ALSA channel map
TLV. Store the userspace-selected SNDRV_CHMAP_* map per WSA backend and
translate it to Q6 PCM_CHANNEL_* slots at .prepare() time. Keep the
previous default mapping unless the selected map describes exactly the
prepared channel count, and reject maps with unset positions in the
middle, so a wider map is never truncated for a narrower stream.

Until userspace selects a map, report the default one for the last
prepared channel count, initially stereo. The map only takes effect at
.prepare() time, so refuse writes while the backend is prepared, and
snapshot the map under a lock so a concurrent write cannot tear it.

The controls are added from the card late_probe callback. The backend
PCMs are only created after all DAI links are initialized, and adding
controls from the stream startup callback would take controls_rwsem
under dapm_mutex, deadlocking against DAPM mixer writes.

Allow up to six WSA channels for Glymur.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 246 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 222 insertions(+), 24 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c927672eaede..4fe86ec062c4 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/spinlock.h>
 #include <sound/pcm.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
@@ -15,14 +16,151 @@
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
 
+#define X1E80100_WSA_MAX_CHANNELS	6
+#define X1E80100_WSA_PORTS		2
+
 struct x1e80100_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
+	/* Protects the WSA channel map state below */
+	spinlock_t wsa_chmap_lock;
+	/* Userspace-selected SNDRV_CHMAP_* positions, 0 means unset */
+	unsigned int wsa_chmap[X1E80100_WSA_PORTS][X1E80100_WSA_MAX_CHANNELS];
+	/* Channel count of the last prepared stream */
+	unsigned int wsa_channels[X1E80100_WSA_PORTS];
+	bool wsa_prepared[X1E80100_WSA_PORTS];
 };
 
+/* Default WSA RX channel maps, indexed by channel count */
+static const unsigned int
+x1e80100_wsa_default_chmap[X1E80100_WSA_MAX_CHANNELS + 1][X1E80100_WSA_MAX_CHANNELS] = {
+	[1] = { SNDRV_CHMAP_MONO },
+	[2] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR },
+	[3] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR, SNDRV_CHMAP_FC },
+	[4] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL, SNDRV_CHMAP_FR, SNDRV_CHMAP_RR },
+	[6] = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR, SNDRV_CHMAP_RL,
+		SNDRV_CHMAP_RR, SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE },
+};
+
+static int x1e80100_wsa_port_index(unsigned int dai_id)
+{
+	switch (dai_id) {
+	case WSA_CODEC_DMA_RX_0:
+		return 0;
+	case WSA_CODEC_DMA_RX_1:
+		return 1;
+	default:
+		return -EINVAL;
+	}
+}
+
+static struct x1e80100_snd_data *
+x1e80100_wsa_chmap_kcontrol_data(struct snd_kcontrol *kcontrol, int *idx)
+{
+	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_pcm_runtime *rtd = info->pcm->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	*idx = x1e80100_wsa_port_index(cpu_dai->id);
+	if (*idx < 0)
+		return NULL;
+
+	return snd_soc_card_get_drvdata(rtd->card);
+}
+
+static int x1e80100_wsa_chmap_ctl_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct x1e80100_snd_data *data;
+	const unsigned int *map;
+	int i, idx;
+
+	data = x1e80100_wsa_chmap_kcontrol_data(kcontrol, &idx);
+	if (!data)
+		return -EINVAL;
+
+	guard(spinlock)(&data->wsa_chmap_lock);
+
+	/* Report the default map until userspace selects one */
+	map = data->wsa_chmap[idx];
+	if (!map[0])
+		map = x1e80100_wsa_default_chmap[data->wsa_channels[idx]];
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
+		ucontrol->value.integer.value[i] = map[i];
+
+	return 0;
+}
+
+static int x1e80100_wsa_chmap_ctl_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int map[X1E80100_WSA_MAX_CHANNELS];
+	struct x1e80100_snd_data *data;
+	bool changed = false;
+	int i, idx;
+
+	data = x1e80100_wsa_chmap_kcontrol_data(kcontrol, &idx);
+	if (!data)
+		return -EINVAL;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
+		map[i] = ucontrol->value.integer.value[i];
+
+		if (map[i] && qcom_snd_chmap_to_q6(map[i]) < 0)
+			return -EINVAL;
+
+		/* Unset positions are allowed only as a suffix of the map */
+		if (map[i] && i && !map[i - 1])
+			return -EINVAL;
+	}
+
+	guard(spinlock)(&data->wsa_chmap_lock);
+
+	/* The map is applied on prepare; refuse updating prepared streams */
+	if (data->wsa_prepared[idx])
+		return -EBUSY;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
+		if (data->wsa_chmap[idx][i] != map[i]) {
+			data->wsa_chmap[idx][i] = map[i];
+			changed = true;
+		}
+	}
+
+	return changed ? 1 : 0;
+}
+
+static int x1e80100_add_wsa_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
+				       const char *name)
+{
+	struct snd_pcm_chmap *info;
+	unsigned int i;
+	int ret;
+
+	ret = snd_pcm_add_named_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
+					   name, snd_pcm_std_chmaps,
+					   X1E80100_WSA_MAX_CHANNELS, 0, &info);
+	if (ret)
+		return ret;
+
+	/*
+	 * The core registers a query-only control. Make it writable so that
+	 * userspace (UCM) can select the WSA channel map. The card is not yet
+	 * registered at this point, so the control is not visible to
+	 * userspace while being modified.
+	 */
+	for (i = 0; i < info->kctl->count; i++)
+		info->kctl->vd[i].access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
+	info->kctl->get = x1e80100_wsa_chmap_ctl_get;
+	info->kctl->put = x1e80100_wsa_chmap_ctl_put;
+
+	return 0;
+}
+
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -109,29 +247,43 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
+static int x1e80100_snd_build_wsa_slots(struct x1e80100_snd_data *data,
+					unsigned int dai_id,
+					unsigned int channels,
+					unsigned int *rx_slot)
 {
-	switch (num) {
-	case 1:
-		ch_map[0] = PCM_CHANNEL_FC;
-		break;
-	case 2:
-		ch_map[0] = PCM_CHANNEL_FL;
-		ch_map[1] = PCM_CHANNEL_FR;
-		break;
-	case 3:
-		ch_map[0] = PCM_CHANNEL_FL;
-		ch_map[1] = PCM_CHANNEL_FR;
-		ch_map[2] = PCM_CHANNEL_FC;
-		break;
-	case 4:
-		ch_map[0] = PCM_CHANNEL_FL;
-		ch_map[1] = PCM_CHANNEL_LB;
-		ch_map[2] = PCM_CHANNEL_FR;
-		ch_map[3] = PCM_CHANNEL_RB;
-		break;
-	default:
+	unsigned int map[X1E80100_WSA_MAX_CHANNELS];
+	unsigned int i, set = 0;
+	int idx;
+
+	idx = x1e80100_wsa_port_index(dai_id);
+	if (idx < 0)
+		return idx;
+
+	if (channels > X1E80100_WSA_MAX_CHANNELS ||
+	    !x1e80100_wsa_default_chmap[channels][0])
 		return -EINVAL;
+
+	scoped_guard(spinlock, &data->wsa_chmap_lock) {
+		memcpy(map, data->wsa_chmap[idx], sizeof(map));
+		data->wsa_channels[idx] = channels;
+		data->wsa_prepared[idx] = true;
+	}
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
+		if (map[i])
+			set++;
+
+	/* Use the map only when it describes exactly this channel count */
+	if (set != channels)
+		memcpy(map, x1e80100_wsa_default_chmap[channels], sizeof(map));
+
+	for (i = 0; i < channels; i++) {
+		int q6 = qcom_snd_chmap_to_q6(map[i]);
+
+		if (q6 < 0)
+			return q6;
+		rx_slot[i] = q6;
 	}
 
 	return 0;
@@ -143,13 +295,14 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int channels = substream->runtime->channels;
-	unsigned int rx_slot[4];
+	unsigned int rx_slot[X1E80100_WSA_MAX_CHANNELS];
 	int ret;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
-		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
+		ret = x1e80100_snd_build_wsa_slots(data, cpu_dai->id,
+						   channels, rx_slot);
 		if (ret)
 			return ret;
 
@@ -170,6 +323,12 @@ static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int idx = x1e80100_wsa_port_index(cpu_dai->id);
+
+	if (idx >= 0) {
+		guard(spinlock)(&data->wsa_chmap_lock);
+		data->wsa_prepared[idx] = false;
+	}
 
 	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
@@ -181,6 +340,40 @@ static const struct snd_soc_ops x1e80100_be_ops = {
 	.prepare = x1e80100_snd_prepare,
 };
 
+/*
+ * The WSA channel map controls are added here rather than in the DAI link
+ * init or startup callbacks: the backend PCMs are created only after all
+ * links are initialized, and adding controls from startup would take
+ * controls_rwsem under dapm_mutex, deadlocking against DAPM mixer writes.
+ */
+static int x1e80100_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	int ret;
+
+	for_each_card_rtds(card, rtd) {
+		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+		const char *name;
+
+		switch (cpu_dai->id) {
+		case WSA_CODEC_DMA_RX_0:
+			name = "WSA Playback Channel Map";
+			break;
+		case WSA_CODEC_DMA_RX_1:
+			name = "WSA2 Playback Channel Map";
+			break;
+		default:
+			continue;
+		}
+
+		ret = x1e80100_add_wsa_chmap_ctls(rtd, name);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void x1e80100_add_be_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -201,7 +394,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct x1e80100_snd_data *data;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int i, ret;
 
 	card = devm_kzalloc_obj(dev, *card);
 	if (!card)
@@ -211,6 +404,10 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	spin_lock_init(&data->wsa_chmap_lock);
+	for (i = 0; i < X1E80100_WSA_PORTS; i++)
+		data->wsa_channels[i] = 2;
+
 	card->owner = THIS_MODULE;
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
@@ -221,6 +418,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 		return ret;
 
 	card->driver_name = of_device_get_match_data(dev);
+	card->late_probe = x1e80100_late_probe;
 	x1e80100_add_be_ops(card);
 
 	return devm_snd_soc_register_card(dev, card);

-- 
2.54.0


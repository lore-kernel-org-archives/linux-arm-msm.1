Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5180841DE0A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898515; cv=none; b=Smu+Q10c2wf/3zaHlmfGmlyO481yMFW52qUuUSkQ+4A8qqASTF1ONfaKkpEqZu400taUqJIwT12sQRiK+C3jnhWiFKtZHKX4dvY18VXbpvnyu+fpRa+9iqsCAyLevVFL/XmbDnJ5LeTAp9rPS0Zw8Sv+DBhFfMIaxWJEflEEHKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898515; c=relaxed/simple;
	bh=C6kQA0u8dFmjiOTbOj/szcTJ7oZVTadFFjhW11dhMhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okYomiPsQc7w6BtBs6WnDAfFYSc5iP047Lcgys2GZ6eN55d+XHoKWjzS+sF8Jx6L5UpmZAVuVyabSxf5aifUrbbj8nyGFBZcmcodUxK2vbcs8SkWxssY6QskHgjsczQWXXoC4l+thaZcd/tiJAy7xzpbpXS1nBrAt9gjWQn/Yzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaXadsoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7uzC6hJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaXadsoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7uzC6hJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OCm0j93236843
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CRftSoVFvItus87l++yzWUXHSPN0iv7LNRluqrmJ8UQ=; b=OaXadsoUxZ5sZ0Rz
	VywFprMqFExP8uGB/BRTLoPS2aEt9XPvo2IR5VYolnGT+pZF9uJgHIqSeC8Fvfhk
	uN4HZoSonNmgN+c0ffC7m/WGEJpic4xhAXfZXo0vwC0Ux1DCPwd6t88SyBM8QA3c
	DBXnqJl29L6kUwsxNIKrpbr9dV5n1+RbkbfQdZEsc+splN8obOlnGuIfiu7k+JAu
	svSJ+YalGddJwSCPapTMoqNeaUsLd0qRfncRlmEObKTZFM18HnTsc2laYmnmcSAq
	LdYYHqU9CJ02bezh74PluO6j1ucvgUxy7SCRXMXFDvtUn3fowOgVN46PjHKZWJXE
	lnQrdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf01xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 13:08:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso6669001cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784898512; x=1785503312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRftSoVFvItus87l++yzWUXHSPN0iv7LNRluqrmJ8UQ=;
        b=D7uzC6hJaIOQ08Jpluj4zRmtGTPA5QkBsEOyNTt3EO42nikpQEzXYDDznCydHBcldQ
         vEmFno2rNKw5HK7gezQJ3ZfkzlKcP5gP/tXcuCkr8muhLGRuxggeSfNjQtcrARlue7DJ
         3sSUCDzpE/jBOlENG1Wd0lNSxjk5X1GWL6tuqvEtU9fyjVf4ExRqSBshHPuIxz1g5xOL
         jHREq5XeaTEp/um5zhTNHseCpyNfu7FV+Zy4QQjGu9/rdCw/qofZ1OfLMcTgTFnD0A4l
         L1YkWzbpVUE3WZtvuc27axV3ak5+64cSa5ZjlpNOGzZAaxtPB3C6DXpYAEaPah6zk2Qh
         SqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898512; x=1785503312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRftSoVFvItus87l++yzWUXHSPN0iv7LNRluqrmJ8UQ=;
        b=I+IASnbWgFFGEv6Wmq+5Y/4KoPC7NevaHU+fgvNyDlLs3+a+2zEuE7aVxhwIGsfp9x
         kHNIjScQHwklSRIcCTOuNQbC7IVw6lVjyiX/k7ib9/JEjBlamqwTfsibg8JDOHQuVuIh
         3kCn4K/zPLXIaWUa4ifEumjuzcNOSG6qVPIlARVgArTRVYhVzTFPXf4CoQsIusPLyq//
         C/2cX6D75Ii2l46K1YdxGjvrQvuWTNxOGVwwN6QvxpDeMBh0zJVWVg4wYxELOzCtx1l/
         9iLigFaop9BX1LEf4RyuwcYvIqntTGaZ8LpsI/Zs+KUIF9lZhbIxCcMM2vkka2sQ1EVO
         7UZA==
X-Forwarded-Encrypted: i=1; AHgh+RoRGVYnOb3YTuAXp+A5tdyKYn1s1ctsTXvWIkOHiZT+VOWlNoYf8An2gwLhm3G04kUd7XNMjbSyHq3AWBRK@vger.kernel.org
X-Gm-Message-State: AOJu0YyO86LUBL+ah5SJPFslWRogdB6pIBrHAuYw7UE49u9NYUmA3k4K
	m2A1H9De4w+XiyOzvphjrX52A/A4znQmbqvqbHVIGyS6u/SNtN0pFDWgAb3uYzyLE/Fmhuzzzcs
	OYLrE7+fNyRO1vDpnTzGlynghEQpFz3j5kU01uo0ElP3yge1m6mAogbS7DR+2t1tTVfNT
X-Gm-Gg: AR+sD13tDUXzpZh8VVtHyITBOHlkaOfzFfPUqNx1heKv76pPpAuVx0dA4GhrRcyhfG3
	LfJt7e6nBN/5JewWhtckrGZyjtpmVy/zzl7fo0J5PqJcjciEes01EHHy1aWNEnZU5+qVboeiHnW
	Aq5snhObEqwgXSftpXkyTLXlnrP8ih8V62RPkyWEpwFDUG0eBHj4v8C5MbRUmGF1jm6oEX9Q/9+
	vNz+Zs5NOPpJPYs8CfkR/FK5GiShUiWygJPs4Ix69uq30Mx4CO3ErMcullSmwzNLH96Z+xESa0y
	Qqdfhg7lDghd9KkLCE0UpY3GvtLYbALWxUlShH8OcXTdtPg4tRgyVgpQmlUdksvnQcnW0UoZq4q
	SmdDqnO/O
X-Received: by 2002:ac8:7f42:0:b0:51c:12bf:d4a7 with SMTP id d75a77b69052e-5283df1079cmr73441141cf.45.1784898511297;
        Fri, 24 Jul 2026 06:08:31 -0700 (PDT)
X-Received: by 2002:ac8:7f42:0:b0:51c:12bf:d4a7 with SMTP id d75a77b69052e-5283df1079cmr73440321cf.45.1784898510460;
        Fri, 24 Jul 2026 06:08:30 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957afac1cbsm64921045e9.10.2026.07.24.06.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:08:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:08:19 +0300
Subject: [PATCH v2 2/2] ASoC: qcom: x1e80100: Allow userspace WSA RX chmap
 override
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-2-2ca3c1250018@oss.qualcomm.com>
References: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com>
In-Reply-To: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=8327;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=C6kQA0u8dFmjiOTbOj/szcTJ7oZVTadFFjhW11dhMhc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqY2PGFrvxzqkNaDJT6ibLEfsIj7PCotzC8iVg/
 31WPKHuuyuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamNjxgAKCRAbX0TJAJUV
 VnCUD/9MBA4mfc+Ud8GfCziQlrnAPjIU2aIASNzwZl7YXN/5DmLMwde5J+XaSpk7KvR1WYpJwq1
 D0DTNKbjmehh1Ug80H3dG98b5aH5yTnytrIYWrK6KVfBFumSVKkJEl7O1vEn/IWYdJ4E7ugQ1DY
 hQz7MKDRqR3OTFCb3GO0HTc54UiSOXkppJVUG0xSsarUs9VoBOnXX7geBeplrwWtSkcTTDkuJK2
 AtIgjdIhLrUXomIkMV2WAygXJtWJY6qtI2RAEGZm57knVrcfk1M+8hATbgp0sTXzSpfCeELZhar
 yltsqe4UOzmQSaIBv/jCz6lhf8PSlVoWaWj77lpJ7Z91aIV+RX3H9pIOG4+zeiXjMJdtMLVIWfK
 WPOYRfXDX1cstuKx12brDcwjtJnrZuPrZzU9vEYkA7sc+unS/D1RhVFNr68gSXCHgJoywVG1cjl
 6rE0ebOidatxPMzRGpxsbkQ9RrxrIRB/3i9dpWaX/UtjEMBG8RNP8biM7m9pZkd4qdeBxUFGtt1
 S/6u+qJh3U1c0f+w/enHpniedK1cXt8H88RDIZfRAoYMM4SAz94GC8oRD7EzBnyWaT/2c6Z2iEn
 7+1aU9fpCT1n6BCF2ChX6rInSmtXQq5WD2STCq9BQVH69QKh26P7CIrYVwxm6gYeAamcf2YscHk
 /CsLfaeE2gcvdTw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfX9fz2n7LRtGJm
 h0H4sOtSz3BbD2H9wQfF7FgjDkBTulmN8qySkHkJpRzclL0KbrvD7Oke7dAOedsm8HtI5Tyx+Gq
 jOYqw18jEoD3WvYNdsAgeWPtMbowscs=
X-Proofpoint-GUID: zB7uM7wBnvcEr8zvA_mdhC2bzNmG-5Ir
X-Proofpoint-ORIG-GUID: zB7uM7wBnvcEr8zvA_mdhC2bzNmG-5Ir
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a6363d0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yfAaYSGhh6VJTT24xRUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfX2595SSKiXflv
 j7IDi3aV0LRzf28vz8+466rRBVqf83Au3xLUmGHWyvt1RkCmWc/EcHLH1aZRHF8PRM6zOIA42mo
 VikyrygAq6tIaXhiZneIi6SqfJe2eay4j1ZdMl/hBN8+hSvx+IUtrJmdQBH5l8cgS/z7QD++CIi
 aKx2KVp4hCiAZDxl6CbArKZDVidqHzwqBHUbIxlqQ8EdYf8FypIHvEWAB26NBBluBJ8RlC7A7yc
 pHBPj6cag9OF/MSGueTKwEjezqQrab3sOKeBbABPXiX7m9ipfnVW2FXIqUnX9q4UOvrksw2RY/L
 lXipR7Z0EVfCZEYgMOBTrOQ8jLKwMPHow8W6ciIUP+/9gIT3A8513WJ9RAIkyzYkRkPlyjqOYVG
 p3wUdbEJ3EaHHbSkW/Id1SBxGXDSg4rVxLbkhkZbX6r0c12y2r9J/tOZvFsbqtNwThoqyH8iYcD
 +6SckEuK2z9XKzfF/Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240119

The WSA RX slot mapping is currently computed entirely from the channel
count in .prepare() and pushed unconditionally via
snd_soc_dai_set_channel_map(). Userspace has no way to express a
different channel map, so any map defined in UCM is ignored.

Add writable WSA Playback Channel Map controls for the WSA RX backend
ports. Store the userspace-selected SNDRV_CHMAP_* map per AFE port,
translate it to Q6 PCM_CHANNEL_* slots at .prepare() time, and keep the
previous default mapping when userspace has not provided a complete map.

The WSA DAI links are backend no_pcm links, so there is no PCM instance
available when the card is initialized. Register card-level controls
instead, which keeps the maps visible to UCM before stream startup while
still storing the selected map per WSA backend port. Expose the standard
ALSA channel maps through the controls' TLV data.

Allow up to six WSA channels for Glymur, and give the controls
WSA-specific names so they are distinguishable from other channel map
controls on the same card.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 182 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 178 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace88..b3d10410b2d7 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -5,22 +5,155 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/uaccess.h>
 #include <sound/pcm.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <sound/tlv.h>
 
 #include "common.h"
 #include "qdsp6/q6afe.h"
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
 
+#define X1E80100_WSA_MAX_CHANNELS	6
+
 struct x1e80100_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
+	unsigned int user_chmap[AFE_PORT_MAX][X1E80100_WSA_MAX_CHANNELS];
+};
+
+static int x1e80100_chmap_ctl_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(card);
+	unsigned int dai_id = kcontrol->private_value;
+	unsigned int *map = data->user_chmap[dai_id];
+	int i;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
+		ucontrol->value.integer.value[i] = map[i];
+
+	return 0;
+}
+
+static int x1e80100_chmap_ctl_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(card);
+	unsigned int dai_id = kcontrol->private_value;
+	unsigned int *map = data->user_chmap[dai_id];
+	bool changed = false;
+	int i;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
+		unsigned int pos = ucontrol->value.integer.value[i];
+
+		if (pos && qcom_snd_chmap_to_q6(pos) < 0)
+			return -EINVAL;
+
+		if (map[i] != pos)
+			changed = true;
+	}
+
+	if (!changed)
+		return 0;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
+		map[i] = ucontrol->value.integer.value[i];
+
+	return 1;
+}
+
+static int x1e80100_chmap_ctl_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = X1E80100_WSA_MAX_CHANNELS;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = SNDRV_CHMAP_LAST;
+
+	return 0;
+}
+
+static int x1e80100_chmap_ctl_tlv(struct snd_kcontrol *kcontrol,
+				  int op_flag, unsigned int size,
+				  unsigned int __user *tlv)
+{
+	const struct snd_pcm_chmap_elem *map;
+	unsigned int __user *dst;
+	int c, count = 0;
+
+	if (size < 8)
+		return -ENOMEM;
+	if (put_user(SNDRV_CTL_TLVT_CONTAINER, tlv))
+		return -EFAULT;
+	size -= 8;
+	dst = tlv + 2;
+
+	for (map = snd_pcm_std_chmaps; map->channels; map++) {
+		int chs_bytes = map->channels * 4;
+
+		if (map->channels > X1E80100_WSA_MAX_CHANNELS)
+			continue;
+		if (size < 8)
+			return -ENOMEM;
+		if (put_user(SNDRV_CTL_TLVT_CHMAP_FIXED, dst) ||
+		    put_user(chs_bytes, dst + 1))
+			return -EFAULT;
+		dst += 2;
+		size -= 8;
+		count += 8;
+
+		if (size < chs_bytes)
+			return -ENOMEM;
+		size -= chs_bytes;
+		count += chs_bytes;
+		for (c = 0; c < map->channels; c++) {
+			if (put_user(map->map[c], dst))
+				return -EFAULT;
+			dst++;
+		}
+	}
+
+	if (put_user(count, tlv + 1))
+		return -EFAULT;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new x1e80100_wsa_chmap_controls[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "WSA Playback Channel Map",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_READ |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK,
+		.info = x1e80100_chmap_ctl_info,
+		.get = x1e80100_chmap_ctl_get,
+		.put = x1e80100_chmap_ctl_put,
+		.tlv.c = x1e80100_chmap_ctl_tlv,
+		.private_value = WSA_CODEC_DMA_RX_0,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "WSA2 Playback Channel Map",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_READ |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK,
+		.info = x1e80100_chmap_ctl_info,
+		.get = x1e80100_chmap_ctl_get,
+		.put = x1e80100_chmap_ctl_put,
+		.tlv.c = x1e80100_chmap_ctl_tlv,
+		.private_value = WSA_CODEC_DMA_RX_1,
+	},
 };
 
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
@@ -92,9 +225,10 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
+static int x1e80100_snd_default_wsa_slots(unsigned int *ch_map,
+					  unsigned int channels)
 {
-	switch (num) {
+	switch (channels) {
 	case 1:
 		ch_map[0] = PCM_CHANNEL_FC;
 		break;
@@ -113,6 +247,14 @@ static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
 		ch_map[2] = PCM_CHANNEL_FR;
 		ch_map[3] = PCM_CHANNEL_RB;
 		break;
+	case 6:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LB;
+		ch_map[3] = PCM_CHANNEL_RB;
+		ch_map[4] = PCM_CHANNEL_FC;
+		ch_map[5] = PCM_CHANNEL_LFE;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -120,19 +262,49 @@ static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
 	return 0;
 }
 
+static int x1e80100_snd_build_rx_slot(struct x1e80100_snd_data *data,
+				      unsigned int dai_id,
+				      unsigned int channels,
+				      unsigned int *rx_slot)
+{
+	unsigned int *user = data->user_chmap[dai_id];
+	unsigned int i, set = 0;
+
+	if (channels > X1E80100_WSA_MAX_CHANNELS)
+		return -EINVAL;
+
+	for (i = 0; i < channels; i++)
+		if (user[i])
+			set++;
+
+	if (set != channels)
+		return x1e80100_snd_default_wsa_slots(rx_slot, channels);
+
+	for (i = 0; i < channels; i++) {
+		int q6 = qcom_snd_chmap_to_q6(user[i]);
+
+		if (q6 < 0)
+			return q6;
+		rx_slot[i] = q6;
+	}
+
+	return 0;
+}
+
 static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
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
+		ret = x1e80100_snd_build_rx_slot(data, cpu_dai->id,
+						 channels, rx_slot);
 		if (ret)
 			return ret;
 
@@ -203,6 +375,8 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 		return ret;
 
 	card->driver_name = of_device_get_match_data(dev);
+	card->controls = x1e80100_wsa_chmap_controls;
+	card->num_controls = ARRAY_SIZE(x1e80100_wsa_chmap_controls);
 	x1e80100_add_be_ops(card);
 
 	return devm_snd_soc_register_card(dev, card);

-- 
2.54.0


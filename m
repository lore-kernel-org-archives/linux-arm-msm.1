Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B544065D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770311; cv=none; b=MdS8yNwtdeyx6c3t0V/JMOMySVzx3vN7jjw4L4PTKG2bntXua21bZ7S6js32CCCNbvR+k9mhkDhvfRY589yRcP/Y/05bAL1QPWwWHl8dOXV2GKTmXiHO97ihgVm0yeXLkWpB3OojWvkElZ3UkTj5gTRpfu3vXkUYNLKvNjegYxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770311; c=relaxed/simple;
	bh=ziCjRvS8TtdVYiLj4p88US3Q9YZrXTSiDrYmN2e6/A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcN92qtCic+104GbqvTuNM38zjWuOGkjLZe5E8vuGgFEW0GGAEER5EjQtX7rw8dbnrk3jW9VekrabWIj+/gh0z6YtP9i4lIJshc7tqjSn0Sq87/onlMrxNX56EAWEdia21XOVvn3p3mbnUfR5+ueN6I93891g5eklf9ty8lGseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgyNXKab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOtNjfC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgyNXKab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOtNjfC7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777LBj3363295
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uwZCEZhplYW
	S8qCNm5tYopBzZBRREgKD5gOszws1oY8=; b=hgyNXKabhOsexxnpyh9VBGqls9b
	mkalo4AxGOHwci/hU22eYviw6r92j8s2T1qBwoiZby2jqYTXLO1St4tbBrdFhNPz
	CB/lF0Mxp+b4yjhIeGg8+j1+f1zBmA0SJsz04VKqoOZoZnlTcNzg3LFQpxBDLPLw
	r1D1zmj5YytJDn7DsObjZNmsuizm72CBdYEM5EulnkLUTXkVtHMjrvXB+rS4BDO2
	pH4p1hht+SNYSiqSG141Hn8orm4djkjRZ0nv7gYRmenDTYWIoNY9L/mtAp0qvOK3
	vMJ+KyTNirswGRUKq/oT9Z6Vvd/mBo9RzZ6Bnb/LiZi8zi20vYh+mOZ3wPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj130d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:38:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so635987085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770308; x=1789375108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwZCEZhplYWS8qCNm5tYopBzZBRREgKD5gOszws1oY8=;
        b=UOtNjfC79I4HSvU40bIrzoUtkc0s17rmT185p/E3qkrqW6VWtoz+nEF9BkmpbMtI2v
         I2ve2Uli6HKdrSI2/Hxa9E8RSHJ4jk5IcJw1K9bkoxM5GaI1jAbrRXKXi31ShraABG2g
         GGRRS4moC7D5gjqELfPtkcn0PU+F3TqkTEySRWfOmQShv1fkDXZBogNfZWDoTrAflINj
         R5Mdrj3uz4Yr5jHvQGzGF5wIYQ3pSRVhPFDgZw2CkQ8v8mU6u5lmyQz9yZy2HnLUg9le
         0cIhc5f0Ecq6UrLbj1vPbbSyYTlJK50E3k//2bk7Ud+R4C2Z/Va/3kLJN4LeBmtb6g5R
         ooqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770308; x=1789375108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwZCEZhplYWS8qCNm5tYopBzZBRREgKD5gOszws1oY8=;
        b=lRloHzDngdX5kLYa0lXjUgx70+gnV8JYqh4WF0mufO3EbUAirQ9vIVgivjg4pSelcf
         6/lT+LZSszra7I7v4v5KqXrGn7GN2zGoX816zHaUa2+GpR40R7Hg+iBXZsPYOq5dE63f
         dMY276L7FTK/Ox5ZJJRqaMdgOA1cVr4yMIFb4pLcF69eHxKkhl0qg3x3UE3HFZLhFBdt
         mgbjW9TvLcYoM+RuEKLEcc05YVCexTafbVqF6NHs3uwD2wU54XIbQPPq+gnZpWSSF1SN
         +KEMWrO+5gGnXbcEMiJDs+/wKg6neGw0TaDTGCUNrcKOLOrFcHlw3P1yJFQaLNHttux8
         FbJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3HCMeq4pyxh1DhpJ82emLLa+h6qOl2NFXuejmpD+kafnK/bqLjHPXN2RIVEm+Wipazr+NiX23eDMBPGmo@vger.kernel.org
X-Gm-Message-State: AFuF++l429WAG9k96VHQSp+WGvWtJWcpp2DNaXvtMhiMzYvVKxPO723f
	VdiROe4LXzdA88gbQLudxQhbLL0jKKBF0dZYa7Xk98isiVZ7zI6Thphhm6xFYEHj0OfLT7wSFZ1
	usvcsHkiMOPph3WGsjzelzyYyMtYJT4tUu+sFj70O7Y0uv1rNLKTdMl57IVgoyalAB+jx
X-Gm-Gg: AYBFou3+21JGcAy/73943eMY+nsEnoupMbdiy9iNjKjhS+C8eqJAjLO69EwgEKcl9gB
	WHeXDum3EA+vhRuyFgovOCToYO1R2FCRgmMXFPJyQKMZxVEJ5zpT3hPpVIzENlUmBU3MMTpXblh
	6Ilj8SffDVxx9JLmlVrdggeA/4gG2ngdw0iKPDnOEiOQIFXyBx7FFNPwT1ypDvFXXMEQ2jEI96l
	UO3Dp+XzgHBLQ0+1RvGtQ56vcqhc9nij8lKfMqEh1IxqOT3B8OKfdijuhF+tWNkhZ9bVEDNPLul
	zTqdhGAKkoCjmF8thzknyVuACZ+7+5qe2VSHIAAVN3aCMf1IwysnTepbsVXboHhVOLAGH3KXtEr
	udGjU7SK+l3mJpQ==
X-Received: by 2002:a05:620a:22e3:b0:937:6d2e:d023 with SMTP id af79cd13be357-93980449a63mr1676775385a.30.1788770308503;
        Mon, 07 Sep 2026 01:38:28 -0700 (PDT)
X-Received: by 2002:a05:620a:22e3:b0:937:6d2e:d023 with SMTP id af79cd13be357-93980449a63mr1676772185a.30.1788770308078;
        Mon, 07 Sep 2026 01:38:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 01/11] ASoC: SDCA: allow building without ACPI
Date: Mon,  7 Sep 2026 09:37:15 +0100
Message-ID: <20260907083727.733705-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX+J7tRzReb6yU
 F7HMf/nK/5AFpI2bG7Mh/zaBtDSZLkp5BAaOmYFdFPBhJlzyq7JhPB4IakZDdDSOsnEoxpkILYk
 oiyul2qlvnJMpjErw2nil9P7muzlxy/W4CLmGDd8hQHnrXk8nVeu5FGuQ8XkzTGL6LqjEdUF45T
 i17M16W59HgtrVXZrb2SJHEINOW4WV+fx4u1QZoPgwTJ/cQdlpNoS23RCg9mNeZluTAOfVSUPYi
 jdcZ2VzhIk+mikT5QGd4Lf1sx3zlYhguBbGZlJDb5MckKBIhUmrj8HGoo7DUpD4C3grhQkY7CyC
 OsTw/x56Zt1TupCboHWTjdwPRjoKarD59zaYo+sd/j5zwTc7zsMfIP6+K1y3AxYaWys0W4kpEsF
 gMhdhqam7F2CMEQavzQrL0BOW6sho0b3y9Z/IaEM4CqNLqU9x2ShJvsa9q+N6EPnBxRwwEpnVyg
 bvWeRSVcRFGfVJ2mj4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX6CTVfYcsVcP0
 Fvqf0RLctVz4kG7EJ6m4ikIQvLKnmJCF4Fcutm19RUftqETCXgSCHTdfmQKMk6rNDDFpkuoiK2q
 BK+v6DKqb+kM88u4hWqjA6pd/L3GE8E=
X-Proofpoint-ORIG-GUID: ptbwxnEArs4DWDxmWJDticAv1mf5eMjT
X-Proofpoint-GUID: ptbwxnEArs4DWDxmWJDticAv1mf5eMjT
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e7805 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RY6toyVs4qztpF5PSasA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

The SDCA class driver is useful on non-ACPI platforms where the
topology is supplied statically via sdca_class_hw_ops.get_function_data.

Drop 'depends on ACPI' from SND_SOC_SDCA and guard the
ACPI-parsing implementations in sdca_device.c and sdca_functions.c
with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca.h            | 23 ++++++++++++++++++-----
 sound/soc/sdca/Kconfig          |  6 ++++--
 sound/soc/sdca/sdca_device.c    |  4 ++++
 sound/soc/sdca/sdca_functions.c |  2 ++
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 2bdf4e333e04..db2672b3aae2 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -60,20 +60,16 @@ enum sdca_quirk {
 	SDCA_QUIRKS_SKIP_FUNC_TYPE_PATCHING,
 };
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
+#if IS_ENABLED(CONFIG_SND_SOC_SDCA)
 
-void sdca_lookup_functions(struct sdw_slave *slave);
 void sdca_lookup_swft(struct sdw_slave *slave);
-void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
 int sdca_dev_register_functions(struct sdw_slave *slave);
 void sdca_dev_unregister_functions(struct sdw_slave *slave);
 
 #else
 
-static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
 static inline void sdca_lookup_swft(struct sdw_slave *slave) {}
-static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
 static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
 {
 	return false;
@@ -88,4 +84,21 @@ static inline void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
 
 #endif
 
+/*
+ * Called from the SoundWire bus during peripheral enumeration; gated on
+ * ACPI to avoid a soundwire_bus <-> snd_soc_sdca module cycle on DT builds
+ * (where the bodies are stubs anyway).
+ */
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
+
+void sdca_lookup_functions(struct sdw_slave *slave);
+void sdca_lookup_interface_revision(struct sdw_slave *slave);
+
+#else
+
+static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
+static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
+
+#endif
+
 #endif
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 4c0dcb9ff3b9..72c02943c49e 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -3,11 +3,13 @@ menu "SoundWire (SDCA)"
 
 config SND_SOC_SDCA
 	tristate "SDCA core support"
-	depends on ACPI
 	select AUXILIARY_BUS
 	help
 	  This option enables support for the MIPI SoundWire Device
-	  Class for Audio (SDCA).
+	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
+	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
+	  (e.g. ARM/DT) codec drivers supply the SDCA function data
+	  via sdca_class_hw_ops.populate_function.
 
 config SND_SOC_SDCA_HID
 	bool "SDCA HID support"
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 4bcd8d1fdff8..3f302bfa5457 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -15,6 +15,7 @@
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 
+#if IS_ENABLED(CONFIG_ACPI)
 void sdca_lookup_interface_revision(struct sdw_slave *slave)
 {
 	struct fwnode_handle *fwnode = slave->dev.fwnode;
@@ -45,6 +46,9 @@ void sdca_lookup_swft(struct sdw_slave *slave)
 		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
 					 slave->sdca_data.swft);
 }
+#else
+void sdca_lookup_swft(struct sdw_slave *slave) { }
+#endif
 EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
 
 static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index e01d91eb3cc8..47dedb62c24c 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -25,6 +25,7 @@
  */
 #define SDCA_PROPERTY_LENGTH 64
 
+#if IS_ENABLED(CONFIG_ACPI)
 static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
 	/*
@@ -199,6 +200,7 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
+#endif
 
 struct raw_init_write {
 	__le32 addr;
-- 
2.53.0


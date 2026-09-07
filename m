Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2076372B5A
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770322; cv=none; b=eHjqvg13JQxP9IOA2Ggs8uL/VC7OvtGYgfGI29eQqtUsY64FOgPAV9+ODhJ5iiA0EJK23d3zIbttDutHkM42kfdPKnAGLzj9KaOtV+KPmPL7pm6+XrG9CQztpXRA0R3U5wkpOr7FWo5kybSg/rEi6ddw7YbW1NZ7SI3I71QGx54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770322; c=relaxed/simple;
	bh=nGv5PetXuMnjGRkeIe8kY1eFNyjb5QBvGtSYOUuF9OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vy4ExtdxE+x70Mp71D0Jde6p21NceB9+9dyhxA3EHCDin842v9yJZ0JWnp0sFjXncmu89Wkl79y5TlMkGs/ATdxf0rxz/8iuvS36IC7V8LR2ZcUohq7NxolD/rWB4bZqgUHjjUh/y0DaHTuhi+SDRmddb/qCdnkzXuK+iJeFSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fm3ix7CK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKnK4BJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fm3ix7CK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKnK4BJE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777cju2146228
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uo7ZUub3lrZ
	EEc8DFMNE8az0niDw3dx2TBatUAmNhAA=; b=Fm3ix7CKWGUCowiXlEr+Uue7Hnz
	3gZYvz4/FECE38qiTik1WO1XqhLpLh/tXjDOMSzVb7gh78zy406jE4pi9R17GJLH
	UidSOTET8i3AaPVVo+nrCNNrKZv1dnPUoDhu5/LUdElUHWucW09C+s6Wdju0oH09
	j8XC56KYJwf/VgX+RgK1tsXpEOMiSO4/HVFzmUYcihiXkVjDUk6NellH8RAQPv9F
	WozCSvnD1WMwEV9wB98ZPjg2WJbi6dMwzWk9mpchUF3AjKvhbCEA8lIOg7/dmyQZ
	kdzvmmxeSTi64DP3ccaVdoTvAb5ktBYX9Syt3lfykjVaW0uysSazeeuxLHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdvy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:38:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso442668885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770318; x=1789375118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uo7ZUub3lrZEEc8DFMNE8az0niDw3dx2TBatUAmNhAA=;
        b=YKnK4BJEUcJga8PapVQCfwFPvuE67segraz7Z8xE9zBF66w5IAP51EPRNKyG7i5vLA
         Nmm6jDmOxq2s53LGjLsoV5XrHsU5gWu7s24Rojf60P/O5Sfg2UK+NHlbIMI69664EpMa
         IJer1kQtfwIUoibaVaKMrErudHUrNxIWYD3lNmSkOfP+TTQ6UGR7zur/0ILEuY0DWIbl
         6fyRjwjp59fh/y9R8k9LWKy53qTMlyjfAF2TLgo05kSRvsR1ORHbjYc/5uETFxDSb780
         o9ua+hqxo+oJDoRJ3ehOiWb3+AHZvtgMc/w8OtGbIF99Y+RsrAu9E1zQgl3yRtNXU0jm
         lfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770318; x=1789375118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uo7ZUub3lrZEEc8DFMNE8az0niDw3dx2TBatUAmNhAA=;
        b=MJbHfaLWkX9DGxbDBjkBcABjtrVDnFaUmK/45Mwc4K5Y7DzOL3wv5GsJ8Z75zGOIDC
         e/2KMNCfaNrQaKBbKZDUMgZEXfCecbE6FAIepRrAii9c4i0OZsYS+52Uy/KIb/7xCEmX
         oBV89q0/jKS34gQ431/s9WUqIrMhCj5zuNOwbflt6MGM8SJPGGbPy6UbTD/QcXmK/wLR
         c4/v4h8Qn3vlDAWX/w1uJY+krF+6hXdYIuqzC34t73HLjn0uIwMIY1N90ecvZsoNnDFc
         dITPbBoeFrqM0UGrr3ZOPJQoM4A9Tnow0G5Mg3fEyplHYdITQpZ/wzRL1MIcoGVeBYB2
         F8Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwTpgNKxIKh9j7w5NvBasgJoIcKU3TQ+vdu17lKrzWvb7JuaWJRgXaPdypnCEr2gZYEiznViQSvUvIWunQV@vger.kernel.org
X-Gm-Message-State: AFuF++mq2qkh/1NQmdUyhL/NWf14DqD8kGf8FqaEeFaGDFyJ3owhIiVd
	D1GYEeFPeVgPE5As10zi9O3/UblJ+CMqgNHyewU290JAccMHaJOvCmcVMsE6Wgz9ZGrEygAjASH
	Lq9k30gY6mPPuMOWPDehyUxfOAG6by5+wzyau8zOj4NOwo3nCjVHzqXgUVxzv3ceMICLd
X-Gm-Gg: AYBFou0XPDfjuZitNGo9ONukkGgohcX0ra8s9i7dcwmHnL+x3fnHkuYlEf54f/Mluwz
	/tErITa1JeQxfJYg9Jywl3OYOrtOTcW1JX7qeZfnfRKJiflzbVOMLX+ONplOMPAHNBzZa9ehAIH
	EQsY/s54cpKNgnH7fPteQmYvBXoz5EMjXaDbD0cHme8ua6dXH9Bf0xQb98XHnF0Z8YDykPf7uds
	Zt7JFppFPnvKtapcOsz5Q1xJkyenIvv3leYX4XUTHtaGXJ9aHM9iYkRGb34AXOOUM57hRoNQmG6
	r4y/+VlW8CCa80I4n+3hiN1J7hdxprVGW/Q4D/+RUiW/I+VYd8nZ4zfdG4glxO6MXOh4jfGnStC
	NGXrKLHWuV22Y/A==
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id af79cd13be357-9398013bb1emr2209541485a.0.1788770318339;
        Mon, 07 Sep 2026 01:38:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id af79cd13be357-9398013bb1emr2209538885a.0.1788770317851;
        Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
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
Subject: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset() return void
Date: Mon,  7 Sep 2026 09:37:22 +0100
Message-ID: <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: nNa-iwmHAzvVj7lgWach-eU5nqrqXtRM
X-Proofpoint-ORIG-GUID: nNa-iwmHAzvVj7lgWach-eU5nqrqXtRM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX+b+45ec6Q1aH
 NfasZcUNj1yGJrvCltx4si6OVpeNq9vgCruUQqa43WxEvQtmLlIqlv9WdmralOkacRdMPJXG7zF
 AQNiOTh0YmJESFGQWdk7MWqsFqeyhy/v+NGHBXdoO6fPir+umAf6rvFKm1LsK0WqIg3zffyrQ5n
 8q+E9KE4hxG9c9rL7tYVmrAisCeb+rth8daZ+5HO1qpqXS9oYNrlO9xkVGvvmp99+Z38f/XAvlE
 2Jhsd6h/cTJfLGK0UC3Jbv939nEx89hVJhZY7qVis8439dWr4O6OWRGmw+BDSDK29kqGfTRe9fu
 U8CLYSV7MZ0Y8DNgbePy6B4A+BdU3Oi2PcIaohQSyV72N567/UEfcdPLc8uNZ4SMdCB84NiEFtJ
 ErqAhjcH6ngTcj1PdfQjkaIKlYtGBcx9T2TEabdINCediF12QO5NDEwEUwUSLSqln0Um6Xst1TE
 jOY6vcyx98NzVloOzbQ==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e780f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-Ca9_MJ7E5AnbNBKvfgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX2ANE79Q6m/k7
 gjebuUeemx/jU9dXFJ077E2WVbE9TUjGaU5EQNRKMApNe0vDmQIqMc4E7xKYc45QluK0R2ESPL2
 A2O0NEjUDa9PhhHWbqQsLIxKz3+7pho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

find_sdca_control_reset() only ever returns 0 -- it just sets
control->has_reset / control->reset for the framework-known
(entity type, control selector) mappings.  The int return + caller
error check in find_sdca_entity_control() are dead code.

Convert to void and drop the check.  No functional change.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_functions.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 25f95575c731..68a50552f4e4 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -922,8 +922,8 @@ static int find_sdca_control_value(struct device *dev, struct sdca_entity *entit
 	return 0;
 }
 
-static int find_sdca_control_reset(const struct sdca_entity *entity,
-				   struct sdca_control *control)
+static void find_sdca_control_reset(const struct sdca_entity *entity,
+				    struct sdca_control *control)
 {
 	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
 	case SDCA_CTL_TYPE_S(FU, AGC):
@@ -950,8 +950,6 @@ static int find_sdca_control_reset(const struct sdca_entity *entity,
 	default:
 		break;
 	}
-
-	return 0;
 }
 
 static int find_sdca_entity_control(struct device *dev, struct sdca_entity *entity,
@@ -1032,9 +1030,7 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 
 	control->is_volatile = find_sdca_control_volatile(entity, control);
 
-	ret = find_sdca_control_reset(entity, control);
-	if (ret)
-		return ret;
+	find_sdca_control_reset(entity, control);
 
 	ret = find_sdca_control_range(dev, control_node, &control->range);
 	if (ret) {
-- 
2.53.0


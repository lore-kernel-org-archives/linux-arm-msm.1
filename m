Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775893;
	b=eS4mFu3bRVohfa1HsuisuCzyfRQkT+Jv5HhSriAydUDWk8+gqFajo15XcNcf2P/UUxTL
	 ecCq875YMfE14HvlYcq4xc+egqCk2EqtznaNDFyaReWAo6YaBXP6BkWJrLMqrnrhfSjf7
	 VVNy6LuReGJ2CX9nIwTARM6EMhhg5jNeEAT1O9efA81+DQip4hNpmC1RofIxd/UO9tEl3
	 GDtxn808wWw/eK6Nuu6qsFHeamFe00aYOmRbiTPQooafBa3mTZJ0IvRPlOnSWvwfuSlye
	 xzc0PQH4ikI2RRGS7ViTvDx6hq0IbasIJHjdm8a4hvo8suqJPIuWCJtGi0WO6TZteZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FOD6X+AD+TXtKsvt62T6M30uIR5j1qKkM7n2nFitXZ8=;
	b=BfsQtszBrxivQngwpEBRHOOw2sER2nUy8EmKIb4kQJTrIEfb/4FZrIMg2h+xezKGt85V
	 IqOCPOJuu///Ol+2hMR9sVeEZzaXpvTe9In70vtTkyxf8H7rb1DmU9OVAr30Lapa0qdKw
	 EzDsOwgR5P5BzNB7VqmkYP3FMIDKXbjrN2ceAO+fPtgOs9NydktbXrQ5zahXbkws78qmN
	 XjXsTjyg0esHyUWWU7akmwNbRVSUZiM5f9Ebb15IqOl+f9B4o5Qn8HUOidqAW3pvcR9MP
	 /6VlYdfQT3emt0M2S78f/OKVdCkyghlqREuLphV5AFGjF44EhZyGsRph/DlUKgXkwsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoefwQ4C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ONoQg2X/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ABC606CA21
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09ABC606CA21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoefwQ4C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONoQg2X/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG35a23228528
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FOD6X+AD+TX
	tKsvt62T6M30uIR5j1qKkM7n2nFitXZ8=; b=AoefwQ4CLZaS28kCveLrX9VleOm
	8yOrFyYtbQMv5assFLSc7X3Kc3yh/EaCNyAfxcI33wIe7R0gz1y1SlqZN5uZW2Fy
	+KWPg032XH30qU/Frxl2QypT72Z3t2XAT30y8MK0s4za7QZdbWhetWlHJJMSs68U
	HrZHJYS/A6lqzMmiHJIVfYH40Ceoo3d2g7SfQoYLp/i9z/ogFnA/M6f69/9FrFbK
	aZpU8iM0GpEd/HF1qnz/V/w+8Edh3HEIQwBMOc7LRieUe/aj57I47Y54hdeFN5/9
	aS67v0hGfpivbTXAZMYDE8y+GafuiXAlODFAZV1edJHKxjGC0mk5Jd2Ar2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart09j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so151567585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775890; x=1793380690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOD6X+AD+TXtKsvt62T6M30uIR5j1qKkM7n2nFitXZ8=;
        b=ONoQg2X/UxAWWvFTafVFNCteHPuJPiHRrjgwKwQqHqhggCiGcUdUmyaTissJKJLVXF
         xBTcgONzI+eSribLJEnq6/ZPsvJaEQrHl4CDYTyHskqYjFH/VdBLEzJuLEkJP0Tw1Eu7
         gWdnEQtCjbAbWuCgch/i6VnNc9YdlCDKATaF9WYRvSZ2BhMpR6UIm1gLsZhRTTmYCaSz
         7GaBKG3Ntw/yw9YsMWo/W4eA3rnrnE/EO1abQcqGWVudrPPQNrHpYk8o3D/SkWDWw6Kb
         4/VMv5RccMAnhhgnBaJNXS8x+iypURoDEtTeEUNj+xSWA2FPYMlinBlZQQs61vmhWqFR
         kqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775890; x=1793380690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOD6X+AD+TXtKsvt62T6M30uIR5j1qKkM7n2nFitXZ8=;
        b=HkeZ4It0x3dauvc4xUMkMjpbC2IcsVsMAv1C0C5DXjBHPhRT/LZbBQCs/SFLARTE9N
         Nae9FXKmIurQIgJEt9tiCLA4DvQa8+swbDvHo1Qi8+ufzCvYabuaMoJW0BpNtkJWBAJl
         mrajn3oewenHKUJUQ/DNcyrDjSvQ6eOVg4Novi48FzCikJVJa5itPI+3Uc+5lqV8N4Ci
         xqSgQtxey9LvVKhUTd3CJCy4S/fhXlLOCinOjj+ysviGqZitz6dFwRS4CEWN7LWv0IOR
         EyRlK4TD9SjuF6+9K/jgCveHdtcEOMSAUmsG6H0xjdZAOglYoRocqAkHgoHMPe3ZME6X
         GF0A==
X-Forwarded-Encrypted: i=1; AKwUvBy4HBdl/vh+d1OPi4lKJF5QfDL34ytZLbqEzEza9T6W47dnj/tehIQA0zsH6oAkRl7J9lawHHSdHoJjUeZ4@vger.kernel.org
X-Gm-Message-State: AFq9FYL6qakwauNkRNjsFaXtlOYrPA+Ly1uYJBQhb6fClchE6kyDm4LD
	M6yCvADI9Qp5EZ3fMCOzRqOuTcdACHjNSADdT7MIPgWk1HkxbmM+2RECjTfGnOQ6S0kLgpULCLi
	6d6TovMy82NfiIsEK+WsuOUI0cBNZpy4GmQMYij341n1y9toGZqz6p6LebRHGsd8QsN5g
X-Gm-Gg: AYBFou2sX0eXaq4z5sIdXI3jGt3y+HgSnVu0lzyTyg0eYNQPj+Ry9JyTfg2GsgHNYWm
	0dIeS7Z6mCgdo0nKhxD0bUHmir8sQS4WWmfFGVAswc8o4XnpDUiD+6h8rJ0nOvl6blocW+pG6AU
	TjApCCrcTZ/nt1lS9AWpdyiSWOUR9AkQUCrIONrDvHp3HDR6ImWnxb3repnC2BqazdCi/LWy8Ol
	uwxW1so/JR0GMXRMnecV4y5ljjaP3bpRNFtK6H6KQRwwYuhXDOveq9he4Z8LTXjCaq7e6bWQhrH
	d/tz4kOwmvGW34WKVcN12sNolMiP/HMX2Uex/kXW+DQwmEBxPC84WZJZNzq0BcusfNPjY9ebWpr
	MRW6yl5C6QgIK
X-Received: by 2002:a05:620a:2614:b0:93f:2ff0:87ef with SMTP id af79cd13be357-93f6f907ccdmr528283285a.15.1792775890147;
        Fri, 23 Oct 2026 10:18:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2614:b0:93f:2ff0:87ef with SMTP id af79cd13be357-93f6f907ccdmr528276585a.15.1792775889530;
        Fri, 23 Oct 2026 10:18:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:08 -0700 (PDT)
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
Subject: [RFC PATCH 13/23] ASoC: qcom: audioreach: send cached R0/T0 to the VI module in normal mode
Date: Fri, 23 Oct 2026 18:14:23 +0100
Message-ID: <20261023171433.820092-14-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX93EEvFoGosWK
 bmar0snyDkJOe0k+GDqHqWjKp1aPJjfAe5Cu9Z6KPaBTO2jPfLIJEtSTlkdzCIwJiG/r+u7Nc12
 YTn2ETRUsgeUfmAqobZV0uiUmQj5MCJjspXHMzfWUhYEH4iUsVrHHZg8yRms23Jk3b7A32bj5wc
 kCOrN9TduIwWalSwA0BwE5akspz0BwJq4PusniUAegfj4P0vE6QCoUV5w0AAp8xBo9+AAO0GovG
 t2+yKxcMWAxM2FmWUFTG1HFhIeBNqHmSe9fVfqlhJtpnRCMwBrLZEmFK+HCDcO400brueAzwoz/
 crUO63ihg3WT/bHFt5D9sCTfcOncrVQse83yKG9l4m3H0ztUzO91qPYwGJPhbabloIoDcVdJitY
 t9zTrzIQMEV0NNFoe+o6GkZ+G7OzPamzf2LBLMY4i4kA5+6Hth9ZPC50y6iohRrsE0UM4qZDSMZ
 BLg7iw0s4jQQBVsGKDg==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adb96d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=AMPNuP1iUC2PUEDpgJ8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/vl6w1DZng4+
 8OjCFW7BZu3bmdw9Uegh+t0dz1EFNKr5bE8dxGP0SX4InI4PbdiGadqebawcHTuTNaXWJBXUV9c
 e2Fcf7WFENGHPhXHaFtJo19Ls4GvGfA=
X-Proofpoint-ORIG-GUID: ANC_Nez6XtSbqJDZoSuplULyY2MYsJX5
X-Proofpoint-GUID: ANC_Nez6XtSbqJDZoSuplULyY2MYsJX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

In normal mode the VI module needs each speaker's calibrated resistance
and temperature, otherwise thermal protection has no reference.

Send the stored values with PARAM_ID_SP_TH_VI_R0T0_CFG in normal mode
and store the result of each successful calibration. Values written
from userspace are range checked, and a graph whose speaker count does
not match the stored set is refused instead of being partly configured.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 170 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  21 ++++
 2 files changed, 191 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 7c15c91888b7..8706471e2a43 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -32,6 +32,15 @@ struct sp_vi_r0_result {
 static struct sp_vi_r0_result sp_vi_r0;
 static DEFINE_MUTEX(sp_vi_r0_lock);
 
+struct sp_vi_r0t0_cfg {
+	u32 num_ch;
+	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
+	s16 t0_cali_q6[MAX_SP_VI_SPEAKERS];
+};
+
+static struct sp_vi_r0t0_cfg sp_vi_r0t0_cfg;
+static DEFINE_MUTEX(sp_vi_r0t0_cfg_lock);
+
 /* SubGraph Config */
 struct apm_sub_graph_data {
 	struct apm_sub_graph_cfg sub_graph_cfg;
@@ -282,6 +291,15 @@ struct apm_module_sp_vi_channel_map_cfg {
 				sizeof(struct apm_module_sp_vi_channel_map_cfg) + \
 				(ch) * sizeof(uint32_t), 8)
 
+struct apm_module_sp_th_vi_r0t0_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_sp_th_vi_r0t0_cfg cfg;
+} __packed;
+
+#define APM_SP_TH_VI_R0T0_CFG_PSIZE(ch) ALIGN( \
+				sizeof(struct apm_module_sp_th_vi_r0t0_cfg) + \
+				(ch) * sizeof(struct vi_r0t0_cfg), 8)
+
 static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
 				    uint32_t src_port, uint32_t dest_port, bool has_cmd_hdr)
 {
@@ -1527,6 +1545,86 @@ static int sp_vi_q24_to_int_frac(s32 val, int *frac)
 	return val >> 24;
 }
 
+#define SP_VI_R0_MIN_Q24	(1 << 22)		/* 0.25 ohm */
+#define SP_VI_R0_MAX_Q24	(64 << 24)		/* 64 ohms */
+
+#define SP_VI_T0_MIN_Q6		(-30 * 64)
+#define SP_VI_T0_MAX_Q6		(80 * 64)
+
+void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count)
+{
+	unsigned int i;
+
+	memset(vals, 0, count * sizeof(*vals));
+
+	guard(mutex)(&sp_vi_r0t0_cfg_lock);
+	for (i = 0; i < sp_vi_r0t0_cfg.num_ch && 2 * i + 1 < count; i++) {
+		vals[2 * i] = sp_vi_r0t0_cfg.r0_cali_q24[i];
+		vals[2 * i + 1] = sp_vi_r0t0_cfg.t0_cali_q6[i];
+	}
+}
+
+int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
+{
+	struct sp_vi_r0t0_cfg new = {};
+	unsigned int i, num_ch;
+
+	/* One R0 and one T0 per channel, so an odd count cannot be complete. */
+	if (!count || count % 2)
+		return -EINVAL;
+
+	num_ch = min(count / 2, (unsigned int)MAX_SP_VI_SPEAKERS);
+
+	/* A trailing all-zero pair is padding, as zero is not a plausible R0 */
+	while (num_ch && !vals[2 * (num_ch - 1)] && !vals[2 * (num_ch - 1) + 1])
+		num_ch--;
+
+	if (!num_ch) {
+		dev_err(dev, "SP R0T0 has no channels set\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_ch; i++) {
+		long r0 = vals[2 * i];
+		long t0 = vals[2 * i + 1];
+		int r0_int, r0_frac;
+
+		if (r0 < SP_VI_R0_MIN_Q24 || r0 > SP_VI_R0_MAX_Q24) {
+			r0_int = sp_vi_q24_to_int_frac(r0, &r0_frac);
+			dev_err(dev, "Channel %u R0 %d.%03d ohms (Q24 %ld) out of range\n",
+				i, r0_int, r0_frac, r0);
+			return -ERANGE;
+		}
+
+		if (t0 < SP_VI_T0_MIN_Q6 || t0 > SP_VI_T0_MAX_Q6) {
+			dev_err(dev, "Channel %u T0 %ld.%03ld degC (Q6 %ld) out of range\n",
+				i, t0 / 64, abs((t0 % 64) * 1000 / 64), t0);
+			return -ERANGE;
+		}
+
+		new.r0_cali_q24[i] = r0;
+		new.t0_cali_q6[i] = t0;
+	}
+	new.num_ch = num_ch;
+
+	guard(mutex)(&sp_vi_r0t0_cfg_lock);
+
+	sp_vi_r0t0_cfg = new;
+
+	for (i = 0; i < num_ch; i++) {
+		int r0_int, r0_frac;
+
+		r0_int = sp_vi_q24_to_int_frac(new.r0_cali_q24[i], &r0_frac);
+		dev_info(dev, "SP channel %u: R0 %d.%03d ohms (Q24 %d), T0 %d.%03d degC (Q6 %d)\n",
+			 i, r0_int, r0_frac, new.r0_cali_q24[i],
+			 new.t0_cali_q6[i] / 64,
+			 abs((new.t0_cali_q6[i] % 64) * 1000 / 64),
+			 new.t0_cali_q6[i]);
+	}
+
+	return num_ch;
+}
+
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch)
@@ -1583,6 +1681,14 @@ void audioreach_vi_calibration_event(struct device *dev,
 			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
 	}
 
+	/* Only a run where every speaker succeeded gives a usable R0/T0 set */
+	if (success) {
+		guard(mutex)(&sp_vi_r0t0_cfg_lock);
+		sp_vi_r0t0_cfg.num_ch = num_ch;
+		for (i = 0; i < num_ch; i++)
+			sp_vi_r0t0_cfg.r0_cali_q24[i] = cali->cali_param[i].r0_cali_q24;
+	}
+
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
 }
 
@@ -1725,6 +1831,70 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 
 	kfree(pkt);
 
+	if (rc)
+		return rc;
+
+	if (sp_operation_mode == PARAM_ID_SP_VI_OP_MODE_NORMAL) {
+		struct apm_module_sp_th_vi_r0t0_cfg *r0t0_cfg;
+		int r0t0_sz;
+
+		guard(mutex)(&sp_vi_r0t0_cfg_lock);
+
+		if (!sp_vi_r0t0_cfg.num_ch)
+			return 0;
+
+		if (sp_vi_r0t0_cfg.num_ch != num_speakers) {
+			dev_err(graph->dev,
+				"SP R0T0 is for %u speakers, graph has %u\n",
+				sp_vi_r0t0_cfg.num_ch, num_speakers);
+			return -EINVAL;
+		}
+
+		r0t0_sz = APM_SP_TH_VI_R0T0_CFG_PSIZE(sp_vi_r0t0_cfg.num_ch);
+		pkt = audioreach_alloc_apm_cmd_pkt(r0t0_sz, APM_CMD_SET_CFG, 0);
+		if (IS_ERR(pkt))
+			return PTR_ERR(pkt);
+
+		p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+		r0t0_cfg = p;
+		param_data = &r0t0_cfg->param_data;
+		param_data->module_instance_id = module->instance_id;
+		param_data->error_code = 0;
+		param_data->param_id = PARAM_ID_SP_TH_VI_R0T0_CFG;
+		param_data->param_size = r0t0_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+		r0t0_cfg->cfg.num_ch = sp_vi_r0t0_cfg.num_ch;
+		for (i = 0; i < sp_vi_r0t0_cfg.num_ch; i++) {
+			r0t0_cfg->cfg.r0t0_cfg[i].r0_cali_q24 = sp_vi_r0t0_cfg.r0_cali_q24[i];
+			r0t0_cfg->cfg.r0t0_cfg[i].t0_cali_q6 = sp_vi_r0t0_cfg.t0_cali_q6[i];
+			r0t0_cfg->cfg.r0t0_cfg[i].reserved = 0;
+		}
+
+		rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+		kfree(pkt);
+
+		if (rc) {
+			dev_err(graph->dev, "SP activation failed: %d\n", rc);
+			return rc;
+		}
+
+		/* Protection is now active on the DSP */
+		dev_info(graph->dev, "SP active in Normal mode (%u channels)\n",
+			 sp_vi_r0t0_cfg.num_ch);
+		for (i = 0; i < sp_vi_r0t0_cfg.num_ch; i++) {
+			int r0_int, r0_frac;
+
+			r0_int = sp_vi_q24_to_int_frac(sp_vi_r0t0_cfg.r0_cali_q24[i], &r0_frac);
+			dev_info(graph->dev,
+				 "  SP ch%u: R0 %d.%03d ohms, T0 %d.%03d degC\n",
+				 i, r0_int, r0_frac,
+				 sp_vi_r0t0_cfg.t0_cali_q6[i] / 64,
+				 abs((sp_vi_r0t0_cfg.t0_cali_q6[i] % 64) * 1000 / 64));
+		}
+	}
+
 	return rc;
 }
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index e30603674e37..67a9d3c66fd4 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -722,6 +722,25 @@ struct param_id_sp_vi_channel_map_cfg {
 	uint32_t channel_mapping[];
 } __packed;
 
+#define PARAM_ID_SP_TH_VI_R0T0_CFG		0x080011f5
+
+/**
+ * struct vi_r0t0_cfg - Per-speaker calibrated R0/T0
+ * @r0_cali_q24: Calibrated DC resistance in ohms, Q24.
+ * @t0_cali_q6: Calibrated temperature in degrees C, Q6.
+ * @reserved: Padding, must be zero.
+ */
+struct vi_r0t0_cfg {
+	int32_t r0_cali_q24;
+	int16_t t0_cali_q6;
+	int16_t reserved;
+} __packed;
+
+struct param_id_sp_th_vi_r0t0_cfg {
+	uint32_t num_ch;
+	struct vi_r0t0_cfg r0t0_cfg[];
+} __packed;
+
 /* VI per-speaker calibration event, raised every frame in calibration mode */
 #define EVENT_ID_VI_PER_SPKR_CALIBRATION	0x08001511
 
@@ -1116,6 +1135,8 @@ int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      uint32_t param_id, uint32_t param_val);
 u32 audioreach_get_sp_operation_mode(void);
 void audioreach_set_sp_operation_mode(u32 mode);
+void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count);
+int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
-- 
2.47.3


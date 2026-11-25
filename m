Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621728;
	b=kUWQJpcKfJOST5yF1EvdBy5KLyviX8O2qOG3xtHfXjS4gIGMPmpKmPiOeVrlU1LWiCox
	 5qJvdzMuwLYzCeMyx+VPkD+YouzcCeoc3r9VhM2bFA2i2Dm0fhH8CspCsKMK2zhPQQRWv
	 eJrCOpjccxoek+/xtB4SaywnSvmOd2bRqKGBzBzkfdsMLf5ZHj9ynOuHwZjiy7pIZhEGP
	 VgD8Ttq++zkt3535xPlHUXMP0sQi2kD+rjrENo4AkWbJucQCHjwUKpVfAdgrbqU5szvWV
	 L7g+1dhfcs5TT0lT53fB9WbKRFsIxGA4MzMLmPm5MPtXwtnP30fJA1N4ulRKzLu8ZjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wxSVRwxGNjXl2Dx/xEhoHx9TtGEitCgAjQW8e9eF30M=;
	b=KNsdKrfhQWSbO12DuGuJ9CFgZJbKktuUwGPv4PqPca0munuxVamGqfb6GVbZ9+PnnOmD
	 oI6XHxZ987DFEjmDlDqQgIIfIWSz96o5eLMRls8B7cUYmAY2VOGuKY+2aWXoUt504LKR2
	 vhHtpGnngpzEalfqitLfz6b+DUanhqbTFJ+ywee0wbrdh2zoosKQq+N8GxB7ZD4JnqYy2
	 DUPlR/huHRDpTpA14w/tP0Wa3VrVuii9c8asPBjcV/qq3Cnjpog1n1eFiiX3dCUpZWxk1
	 WBM69VGFl8UwKkzFGjc/Z2B+SCACJHpVd7EjDrdmpKIlpREM8rU6CZGY39uExw6IwUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On7xl3rC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g2yhE1mA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F19606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F19606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On7xl3rC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g2yhE1mA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM4cr539719
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 15:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wxSVRwxGNjXl2Dx/xEhoHx
	9TtGEitCgAjQW8e9eF30M=; b=On7xl3rCZxS1PJ8IlMfo5mBJyNyqprp5iTw+1V
	FFFYEaY9KsCabhupBBUEA8V++vCArdve91Nl4ybEEfvGWRMOwUia6sxW6fptp25Q
	AO/bfmH4HV1F1LqqEPt9z7zcukTSKKfdDzXXbI7BOpO6/dlJY8uJ6+ga4N368aEv
	897YV6wWratNtQeuarvhRxw988KkadCnkRBd4PGItiXRElpFBt6EN71gBKCF0Pkw
	3tDfy0sVQWvxOB2QYVqK9V3FO94Chkufmvfud1Ve/MQgwzKjU9KjnlymZ5yuiDz6
	Byf5UmXS8onEjrVuH2OQq8TzfcpbfQDg4IOYFyvzFHBMpQTg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhsnbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 15:48:46 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0f1c06332so88556797b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795621726; x=1796226526; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wxSVRwxGNjXl2Dx/xEhoHx9TtGEitCgAjQW8e9eF30M=;
        b=g2yhE1mAs92exKhfCFRGEpfUPSAsE5ovIKp7iD6+F4a98x3gm1nAApFLDUuxcQLAy/
         ZnJtJzy25g+tpoXSz2Iz4NE//APA1GjZKD3Tl/w3zWUN+YsdJQe/Bzy1OcXpDI+6mgoA
         2V7QKqIDrHySVYhP6VgGzlO4h146zG1LpDJVpBi4sy268MUYWY6yqALd/x6O0g/95Wv4
         r8RyJC/YsRj3vVQxjF6IgAmtXfWynz86ogqBa8oXPehAGk2wJxvp62vaMhM+lpbu2BNS
         5In4cyCd52D/icIJaGEe6aNRZnaQMWrh3lgtQfPIRakwHI8+v302BjCciuAdxQVak7Fo
         MkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621726; x=1796226526;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wxSVRwxGNjXl2Dx/xEhoHx9TtGEitCgAjQW8e9eF30M=;
        b=wIWUkWA9jk8HZuGwhE32joOLxM5HQ3JgysxS12NBMC5XVQFs1m6DKG0TOQFLE9rH7H
         1tc+s8MnIh7TVoGOeKeptg+jsE968vE2vQnZHECclUoEbFmZjOIBRCUxUC07UJgJz0f+
         ukIck+8YWh46bUgrFvdjiPhBiKIbaKCK0jPUoCxcrF1L7HzgLImf5O4zeiQNqjCCCTOw
         6EefbdNV1CRO3U+ZfV4jur4keYfRM99ok25/vz5Oy+gqVn5NIK3OnyaPmsfAKOHnMe7g
         2vZJNmPF4K574gR5zIjKJiYKBpUdnsnjZd2cUDZlGPvkSWXMzyI58JsjOm7HcR8/RTKn
         FOLw==
X-Forwarded-Encrypted: i=1; AL+hErFLAIE2xuKhJSGjKEvuy6mAQj4/vQE4IEma0X8FDYA8huyeKiTldo638YqPzHNF52BKEY+57A8VUd50QcnV@vger.kernel.org
X-Gm-Message-State: APuU4Z/rG56VgFQacEx47+PRyhyRDw1+iYZPePE2LLWLy1PmUS20t9Sa
	aqQgZX6Dllyz1e2IoZ+xVTCsNrj+XL0At1gUi8V2RnOKrk6GnWqys2Ey97vqVgByyPSNFsWEPxy
	4DypYrEvii2VDFkhcF5Xs0Z7KCkrFD2U8BNfr3T4opeCd+Ed0hMJ8B3chSjaVLKhjdzaJ
X-Gm-Gg: AZFdTZcd1sOsEP7FST5MPJcVFYjuKLG+9OCEkgYn+HJjKih8tIPvyHQ3fEDDuuL+izU
	QJpFj+57lhMvvX4laeN8CXUdr+RL47m3bgl1mizQkW1A1w+wjJDcr15z0KRxnxyE/D1Xki31flM
	iHZ+t25kjGnwKkrvnPCim5LrzdSRbRX0Z1HhhT5pgzIJ7gpCHLeSsb/x7+VfXG6Pf8vO9kx2cqK
	P2ANMM39JZu3SrRfl9QDfz/CdfwhS8zh5bUbMcBnDLw/bcVLp7nftyMyAkao3uM/l+0pLMxo99b
	tLlU4pLfFTFrbGHky2w5agTNqFjAEe0yRMN/wn5GteSClevjVC/0Gphu53TFBglpmMMUPyB0vnq
	w/R0yo6DKifsdMFSWf4KAhHcHc4RJTnevjS8rkXRIO4KkHNmP1588zsEihTjJUh8c+ltuAu10Xs
	QnrdCjLiQ=
X-Received: by 2002:a05:690c:2a45:b0:8b0:d438:a024 with SMTP id 00721157ae682-8b5204b538amr66569347b3.37.1795621726271;
        Wed, 25 Nov 2026 07:48:46 -0800 (PST)
X-Received: by 2002:a05:690c:2a45:b0:8b0:d438:a024 with SMTP id 00721157ae682-8b5204b538amr66569157b3.37.1795621725807;
        Wed, 25 Nov 2026 07:48:45 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202f90casm73274637b3.28.2026.11.25.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:48:45 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 21:18:38 +0530
Subject: [PATCH v2] media: iris: Fix VSP clock calculation for high bitrate
 streams
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
Message-Id: <20261125-fix-vsp-freq-calc-v2-1-9825a64d2a88@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFUDB2sC/22NwQ6CMAxAf4XsbAkb2WCe/A/DAUaRGXGwwqIh/
 LsD481Lk5e+vq6M0Fskdk5W5jFYsu4ZQZwSZvr6eUOwbWQmMqF4lkno7AsCjdB5nMDUDwNcN1o
 VTaFRCRbvRo9ROprX6su0NHc08x7ajd7S7Pz7eBr47v366k8/cOAgc5mLttR5KcXFEaXTEnduG
 NI4WLVt2we3dy9bywAAAA==
X-Change-ID: 20261005-fix-vsp-freq-calc-19b967b79e62
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795621720; l=3154;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=zQeiaIxtG0nlXCeoXnxDDCFVPvGkd7BtMIJ10iaZjBE=;
 b=mggLX9MZX+5QLFPAH0Zh2Xz/tyYotKGuCWyFHDTUqoS0XASXSduU19rXMolkj9ccYwO4uZOdG
 eIUlPhyjNWdCKzcVrZ4A3x2Y8y4cqwmdWzLjNMEmqoJoancrc8ZDxJ8
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07035e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bD6gx3CI9Ee8KLyf7M8A:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: iVE8iyWiYY6aM3z0ycUG126crV9rtZLH
X-Proofpoint-ORIG-GUID: iVE8iyWiYY6aM3z0ycUG126crV9rtZLH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MiBTYWx0ZWRfX7Vsuls5W2L2Q
 Dp1kiOjtDrjcM3UshtjvIysOSDv2uQgzFjFp2ADwgq+YuhNVrfWfbRmWzVO0bCe9UEeD+hh4gyG
 mSGeKN60wUFBV6iV8TIYZOpiNFrc408=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MiBTYWx0ZWRfX75/QfdzKmDSJ
 9IasCECUkKPiXekvPqvBiU5otqWYjpTUgz2YlwYtrjXdyduP76X5p0RIjVTM2i7UQop+Qee8bzU
 vIeL2A00XMB/0aQApgZCdh0EWqVHkX8KOt2oqjCSFXbOB/IDNb/b3//pwASGwD1x9yqJj1nvj30
 feGTnWc9nfSsNXo+gg3eIylriIhHNMKoiS2kv3UIDfkpN4A+6x3u/6TtLqs4Fk5uxP05Yo4Az7f
 v9lzFM1OjWlXnnzeDlmP3FgRbhOhXBSLUtrDj01BPhR2gNwrEvLrl5QqgA0YBGjmKrYvnQmRLTc
 FovLlHN/XdKWvb8aQZuCJFxnhcMoQ69v51ipDKYNVTsxT13PoBN2m3DzMUWPOTbpCsOUs3fwre/
 T/0T3Z+BnbS82w6/B+hraHJEIIHR33oi+usa5pi4rbBVMpBF3MbzumFrtD9tSq/8FirjxwcQ/Ji
 seWJ7HrqaPgUKt59/dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250062

Frame drops were observed during high-resolution streams decoded at high
bitrates, as well as concurrent decode sessions. Analysis showed that the
Video Signal Processor (VSP) clock requirement was underestimated for
these workloads, resulting in insufficient clock scaling and reduced
processing throughput.

Update the VSP frequency calculation to more accurately reflect the
processing requirements of different codecs and bitrates, ensuring that
the requested clock frequency is sufficient to sustain the workload and
prevent frame drops.

Fixes: 82b96a8d8d6e ("media: iris: Move vpu35 specific api to common to use for vpu4")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Used the configured bitrate for the encoder VSP clock calculation (Vikash)
- Link to v1: https://patch.msgid.link/20261006-fix-vsp-freq-calc-v1-1-53532d893852@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 32 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..376ea758c5dd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -454,9 +454,24 @@ u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
 	return max(vpp_freq, vsp_freq);
 }
 
+static u64 iris_get_vsp_ref_bitrate(struct iris_inst *inst)
+{
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_VP9:
+		return 70;
+	case V4L2_PIX_FMT_AV1:
+		return 100;
+	case V4L2_PIX_FMT_H264:
+	case V4L2_PIX_FMT_HEVC:
+	default:
+		return 150;
+	}
+}
+
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	u64 vsp_bitrate, vsp_ref_bitrate, vsp_ref_freq;
 	struct v4l2_format *inp_f = inst->fmt_src;
 	u32 height, width, mbs_per_second, mbpf;
 	u64 fw_cycles, fw_vpp_cycles;
@@ -484,8 +499,21 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	if (inst->fw_caps[STAGE].value == STAGE_2)
 		vpp_cycles += div_u64(vpp_cycles * 5, 100);
 
-	vsp_cycles = fps * data_size * 8;
-	vsp_cycles = div_u64(vsp_cycles, 2);
+	if (inst->domain == DECODER) {
+		vsp_bitrate = fps * data_size * 8;
+	} else {
+		vsp_bitrate = inst->fw_caps[BITRATE].value;
+		if (inst->operating_rate > fps)
+			vsp_bitrate = div_u64(vsp_bitrate * inst->operating_rate, fps);
+	}
+
+	vsp_ref_bitrate = iris_get_vsp_ref_bitrate(inst);
+	vsp_ref_freq = inst->codec == V4L2_PIX_FMT_AV1 ? 533 : 480;
+	vsp_cycles = div_u64(vsp_ref_freq * vsp_bitrate, vsp_ref_bitrate);
+
+	/* VSP FW SW offset */
+	vsp_cycles = div_u64(vsp_cycles * 1000, 1055);
+
 	/* VSP FW overhead 1.05 */
 	vsp_cycles = div_u64(vsp_cycles * 21, 20);
 

---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261005-fix-vsp-freq-calc-19b967b79e62

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


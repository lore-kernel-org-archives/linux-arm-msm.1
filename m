Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621879;
	b=efMu5vzpnDh9P0uK1bCokh/TZJfKB2bbZIJhrygzl2+kqiytlqpPEDPIRpv7Kxae55WA
	 XkldHvuIptBVJtHo38fM/L3S0AITQi9TCARrGa3XrNsYYm1zfULsbnZWYqBy4erFWeQFL
	 pFoR+jrROHhqgQerxr/lfdiqU7DEx4ltlCbt6Mv0eqa3spHIjTOmOLO5gwAKqKrzL10HU
	 xiENKcwr4G5pOpN95dCKTcvpuzPgc7NLOZHYrWz3D39W3jzbwZBdVKiRpnEupBtz2gAiL
	 1DIYT1E+ia7avKneUAPv7vPb+JYxrom4fYjfZN0191b7vbYy8zDerszCgAE73qQyu3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WrbMrv0h6y/iikQNp1GRWO4ASKxkJC9TURHwVPkxEk4=;
	b=eM/mtHx35T7gm/qPTZNmiSyhHmoXKHrtEvozz1GRvmix4+XJBliq5Ed8NXKhRrfqcvql
	 Td9ZL7XOpPZ2ruFN1kbqqnuygAs7bo5WIwfsT34LOnYdj4Fy6lyFFda0UtlkQKBIzVGtP
	 p99stHygni7Zaz5gZxNRH0Eb+JjVdNzfximto0Xx7p1lk1wVLVQzA6mKvS4JxgEMSpFKh
	 WGPCbNCI5ixREr3lNh1JolXZWNiCN1hpEwzx/0aKgUH98arxZCv1aLXmQKTYrAA9c2LqY
	 aVejmoKW3WX5ku0kGumdA/VI7CAMBuigFC7qODdEZ0KxNJPeRARbSN0899KmPJfSEuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Lq7Ly5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZwpU0+u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DFB606A330
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DFB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Lq7Ly5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZwpU0+u
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ASHn2880918
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WrbMrv0h6y/iikQNp1GRWO
	4ASKxkJC9TURHwVPkxEk4=; b=U5Lq7Ly5xFxWL+cIljkjN98MuEPW78NYsmnZI3
	/M4LbzRAdAmfrwX39Bqpi7dSRQZHF8EA/aoYH+iJ7LcBZYSih4gNjF4jIWtTrLEk
	ZgVLWK3CN6F+4CePanIodAtSRmu/Vj+BXjzgZAqGrbqK+yyiqGMzrs/6HMuljmKb
	fwyWWpN7Zlo9ojzSabjOmPlRFI3fcTPe56vs4sx2SSIbpMYzWwovy+LxEcLJwd6/
	vV7BT2Cg/sqjuXQLudP1HC1PtoNa4GwxDzUpBQsz3Pq4a/oO2ppfyQcbshbucGV0
	KUJxftfWBFbsfTcQfWe0TG4Jg7nsBCNNYU5Z+VUZ9H9Jou/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgs7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:17:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so525198385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621877; x=1794226677; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WrbMrv0h6y/iikQNp1GRWO4ASKxkJC9TURHwVPkxEk4=;
        b=KZwpU0+uG7NLMrYJ7o8HkUC8WeqsWOkW7kj9pdvolC0paxnsxI33UFVkldRFGt+li9
         V8ww8HZO/XgZ/u3EaFxjbFsCG2drGyu8CgWp/ylXr0tdzZBpSxB2S+ealRRzsV9Ymyzo
         r7B5hl2xIMVeBcVnvjlq384PwbyNogUbyqpOcsYyikEGOCgkN3h5mp+TVldqyPqV1EKq
         ZKermpMv/eusYZPfhVKPqEU7wVVyU3/BFcgLlT5LQMdI7ZRQDR3V7Dlmzf0odMe8qeAI
         SxEkK6q7p2VR1K7npOw7ZGG4uPL4hTcJrf9bduBZIDZvAIuj69u2RTmczilEZqgYkdMm
         RnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621877; x=1794226677;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WrbMrv0h6y/iikQNp1GRWO4ASKxkJC9TURHwVPkxEk4=;
        b=Wm0aTllKcPQHc0CFO3NRzrzzPa2zpH0PdPo1cO86iJKz+8n+SPblCv74ZRYpPRNNY/
         r4iV8izA6hQKKPwZdpVa072/5jrTF0OxbEuKFxdXiI81yxB+qPkhF/BKm8AJD+U3oFIL
         jnCm+VFim8fnBEL7mmZ7WKOwrLbG7qA4oR9BwEROwfE+OsZmCMJUhPSLvOruTFHe0pg4
         r82YyFTTrjBm+b8oKTfQ1yMUJ6iO2MlHnatPI82uTMzpHFDn9rcqTbjtV2A/tIglx2bx
         aZeCOOWRupWm3DeMdcX3W/r/toDC51iGqc1xZmOD5803iv7zJnaijQHj5LLyI6T+P0as
         k/fw==
X-Forwarded-Encrypted: i=1; AKwUvByu7q9yyDDK8Js7U4Pxga0e1fJ4ZHed+cfw3N/7v3308gmxLntsg2NVhDiZ2QUCU+DoEHAmsnrnIo032YVO@vger.kernel.org
X-Gm-Message-State: AFq9FYKEbNbmWiOFqpu3CmQIPnRsCImYsOSd+818TxrT4ofhK28scPEB
	ADcOqoxyyFr3HPxAdBCs3tejjN1KJ3mRiWH2OkZ5dRfm4JGXAuhj6IrlrnE7D+wuuZ7yHIsxGPv
	X9/7f0Twu0s1wrlya9oKHBTukFTd2TWacve6J87Lx7fKirWIRFSmW9ElNBs1ZqQ1x0/up
X-Gm-Gg: AYBFou3Kr5V6yvCT8poEm3PMLXfgYLpqCxPXbLDDU4XdWOoYcqPUWriskXqs8yqZ/0U
	wwrL6oipgR5rSEn6JZ1mwxHzL2GWfFOcIc7VQgYPJqk8WiWP6FOjRa58oWEpxqt1jsBnfw0Baeh
	HogWbNT4ZAfnKw3zOEwpPtIRAxeNbpZVk5lOu8Ng/qW5nugCs0V1YjlRyStVGs6pEuahx9LrbDY
	cyAruoiFP5XJh0N6eK5WtxJmw0PU43DkbIF61zz7bXgCFgalMgBBJXL6eiMtXxFqUk4xT9YCTL7
	AzlULOBIOD8b8LoZAr67YyCUpiX8r3eAeJm8PMGL6HxqQxbOlEOsmx70ST7jId+lJiVVhyGbZiQ
	uqVAPtbfvTxI1Sc4NhpH7F1kDRGz83fTNJchHIBWENxbx5CO9tMYrUh6CGg==
X-Received: by 2002:a05:620a:a51c:b0:945:b967:475f with SMTP id af79cd13be357-945b967477fmr324818885a.16.1793621876526;
        Mon, 02 Nov 2026 04:17:56 -0800 (PST)
X-Received: by 2002:a05:620a:a51c:b0:945:b967:475f with SMTP id af79cd13be357-945b967477fmr324815685a.16.1793621875938;
        Mon, 02 Nov 2026 04:17:55 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm262583425e9.9.2026.11.02.04.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:17:55 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:17:52 +0200
Subject: [PATCH v5] arm64: dts: qcom: eliza: Add FastRPC support
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
Message-Id: <20261102-dts-qcom-eliza-add-fastrpc-v5-1-27ad8db4a47d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG9/6GoC/43PTU7DMBAF4KtUXjOVfxLXYcU9EIuxPaZGbdPYT
 gRUuTtOQZQFpWwsPevpm5kTy5QiZXa/OrFEU8yxP9TQ3q2Y2+LhmSD6mpnkUvONFOBLhsH1e6B
 dfEdA7yFgLunowHGjDRK6zgVWgWOiEF/P+OPTZ86jfSFXFvGrkWgY69RyqW1jLn16O680ieX3X
 9MnAQKcJdTGG+LCPvQ5r4cRd7W/X9eHLfokL2In9J+irGLXkt/wJgSpzRVRfYuC3xBVFRtSwWo
 lFefXdmx+iDeubhbRK2VU563F9hdxnucP/L/9QOgBAAA=
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6335;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MUaSkQuBi8mCm8TvMJjh5957pvL7KrOsrIXVhFbgVAs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H9x8+/TuHL1Ro9pQ8PZx69E8s6QXwzhH33cS
 jyfOfGm792JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh/cQAKCRAbX0TJAJUV
 VvHyD/4/9AwOUdNjYxXbMDUPI2rA8/gqPYDPUxPPnt4wIJY685BrDJugkqhLAsub/BKtc8UzLVU
 wLQ96uc5Sk6LrRBQ3d6zHAWfMgNgGyRHsMLqyBxInlGrz9+jKUZxtyQoGZH5A41BwGXL1YWSRoQ
 QvP4PHQrcuWWLqM1g+R/V1m+vsINLFeQ9I7+YWit3sQ394OL3Zav8OcfzYMp5xn5hmyllGZq53/
 J1U1ly9ZlCbqIC0vxH9PnVmVT0aSlyT59SWXwfe2TD0u79QY1X/4Gl73GFZvBayQ/5nKjfT2YQ8
 shg7yhp/sU8ntBdtPu3iODTR+9NvZmexXrPPS31OdTGVCRMWUpxNVlU/w8e+CXJRmkuuASZW2i3
 JsXfXaDCaOxRuUaqEgq7PxgQREuuKQ2Zi/fwR/YYinjyqRNuYSor7icjozhM45J2yUCOzutPgXu
 ANPVlQdA8ojZqGs8kReXAoiRtXr8d5kGUhS7RTnO0gU9y3qchmcbdniUnXe1yn/KA6s73aP1APL
 RcqfxaK0LhOXkt6ZJzkwiF9ENeQLfpb+yMQ4TMf7rNPcuccVtN51Z22OsBqyf8hBAEzrMXzqHfP
 bnud+oIfVRYmApMTsqDmd4+BTBaE190+oN4Bb7v/Ve2DDsvWMUhKJtrV0+0rTOGlbqZknMzs8WD
 r2WB+eLPUlAhJ9Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae87f76 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=l4Guf6AkNLRG3ev-55kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 27rdrnlxqGL-QJxQz3xccpDVYk7O7NTY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX329DlGZXPnzN
 IjJSmAsRnwT9O46c6NCoU1VQ5Tt4pkqpuvw+UiRDTuLCWbQMRs3IbxB4YNq1KqihB70R9b6fiMS
 7xiNDt4BvFlEXISTr6z0buXOSiHx9JE=
X-Proofpoint-ORIG-GUID: 27rdrnlxqGL-QJxQz3xccpDVYk7O7NTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXzFdk9Qma5pmP
 nndXNQ06raf7gwPDn8sfxqSY+dfBpbTTcK4s9mkLhVqNdOWItZ24hQc5bkmNPdKblT6hA2nCI4I
 4x3LoyMFO31YPJg16s5ZGMoXg4B4l6thGiTiCG5Sdg00/d7kjJU0txZoxy8cbcU3D40OF7SxMu5
 4UkhWAV+gWs6tvyZ47nF50uRZBgIS/wEj1HSGEkgSqBRaAseGWe5keEPIasPCS9DamFarg6w2ov
 N7odtCaODO4Y/ltozXU3boIkjKq7+9e2F3F88AooB7blDYg85mA0Gg4ZPKtTV5kCNi1HsLLDJ6D
 QjaEsmJVOHYg1/xIwVh3lg1R0g2s99roJNqf2wrZ6mzHT/OLe6yjBrEjNKS/PFobnGVev1UrHPY
 GC/Nw4+/PzaxDGBZF8oL5Sn6LtdW6XCGqsygiN37199H2g8TRR4fQXrSO4M8J+h2jh+2owj3/mh
 AEn7T1IM3wkMgnhirwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020048

Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
the ADSP remote heap memory region needed by the Audio PD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v5:
- Rebase on v7.4-rc1.
- Link to v4: https://patch.msgid.link/20261021-dts-qcom-eliza-add-fastrpc-v4-1-4d33839dbba5@oss.qualcomm.com

Changes in v4:
- Fix the off-by-one in the remote heap alloc-ranges size so that
  0xffffffff is also a valid address (Konrad).
- Link to v3: https://patch.msgid.link/20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com

Changes in v3:
- Rebase onto next-20261015.
- Add the ADSP remote heap memory region (no-map) and VMIDs.
- Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20260915.
- Drop the CDSP glink-edge description, as it was merged with the
  CDSP remoteproc support.
- Use the documented 0x1063-0x1067 secondary ADSP SID values.
- Drop the undocumented tertiary ADSP CB7 stream (0x1087).
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com

Prepared with help from an LLM-based assistant.
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..93e922de53cb 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -615,6 +616,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0x0 0xff800000 0x0 0x180000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x1 0x00000000>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0xc00000>;
+			no-map;
+		};
 	};
 
 	smp2p-adsp {
@@ -2432,6 +2441,69 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -4571,6 +4643,94 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf

Best regards,
--  

Abel


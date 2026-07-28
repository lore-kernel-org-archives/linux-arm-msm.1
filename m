Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2803CB57E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223568; cv=none; b=j3K2s6pjGvPMYFCSwc+LvAlhPKmahbZL/YPNI50E5VoD3YjtlX6PwreCxcLqiaqMrOfE2ac7qnRRqKrHP3+cZ4N+DTxbL4V5lh1C/AflrYMmsrqDNftB4QiOOUrmQJL2p8KrKCpi0sNCuJfqB+03H+5U73pjLNl6jX9SULKo4eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223568; c=relaxed/simple;
	bh=jI+pMVo6vwrYZtjOru0QK/xwdYDWa9bJ5ruLtvL2BeM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vw63kSCbOJW9FcV65+0XNyEYj7+mAzL6e1lEu+BA+asL/lDQMVx348V8+ro6dkBVn1tFVo6Zjeyk3AQeITrX18ChEK0T1RL3hQpfvHUzbXZmUyto4IkwclIuUUg09xF9VIr7ktx4sFx6dRa55pmpGS5G0agtxsy6x0g6Itu7bdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzMcFnoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLwTzsf0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzMcFnoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLwTzsf0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3acsC1527520
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=seiQ//jlDcszo/iyrwaAap
	wYX/N92VueFjzN9Crnozw=; b=nzMcFnoE6ZPdjXOFbHkAWNmnYPPEcVQT1aBFvZ
	VYqszy58ztDHRRMhOL+YT03nSBkBdCSvlHdHXIoWqEqhS7/NGkstKIhSrb3JK7El
	NWBQVL7GwaByrqY+wjh0nwjSzE1h8BCEuOg3ZIl084tUL4Y3fOL9AVioONiT15gg
	KNGvmHhy1KNpqnqmhgfmc6Vhom2eEiZAbvhw5/otS6IV+dulgMNGiiyvxLh8Hy4q
	YEkbZ5L9IFaNe5lZYCvg38Yf+RExXbJvgDuK4B5wPxPXzr3DgDsfBoQV8DQPJvKg
	P3/wNDZE/T9LD6NZVQm4HBar0MAFC2N10yn7uz1HEQwece7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8ayyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:26:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-529ae8e96e8so27219571cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223565; x=1785828365; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=seiQ//jlDcszo/iyrwaAapwYX/N92VueFjzN9Crnozw=;
        b=NLwTzsf0g1mDxtVHMs5juKpwhm32KGKZ3Z8sVw8dH8SQ6o2E9g1x8c00s0koFVbklH
         2Y5Wx3IYkNW2yIQN1ESk04hkx2uMe304kJ1FaWNTmw7nnefi3mAm/w57PpxI64nO5pM1
         svsfdszn2HnpHMs8RKABF9KO/Aqb0pLboAPCQWReo427Z4YRRkVAX0a3Y56AA9ZqBwYD
         klpgdh4DgsK5QTeDxKRBAe4b/lpxAdj3LWoxKNo6/NZ8ufwneVtRUIAedJf9xPdCwwU8
         2WJIlX/zDBbUYo2N0pNGESH9eoWfsFY7mpqnZnKBKcrJS0nRiL6fmtHCwtSHWySw1zMK
         4nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223565; x=1785828365;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=seiQ//jlDcszo/iyrwaAapwYX/N92VueFjzN9Crnozw=;
        b=aEwQsJnOjcl9PwD5id3CIFz3HAPFdzJ4U+YfBhzk69uba36SGAliYP5RN01HNLfp9o
         ctT0tI+S69LNxTfLhQHb3paMPXgI9GNIMLChr3K9rGO/h/48l9So1yMOoi3ujwuJ5hfx
         7CflGj1oPRbd82pSwgDBS6vJ/5k554Su6H2Lb0vVO3uJOJDfa5Gs3wOpFs9MzZwTkDd7
         9s6w8gBD0MzyZvyNS27gcK5EudWtAn9cLJs03TFqE1TKgGx3UXn7orfC7i/ijpG3z51x
         hrFKjzSUA5MpjC/8yjyfBaCGZppgmuB+urKokbPNVsOFBi4B0c1Q4J7bsQ6a05Qgl8lX
         ZvHQ==
X-Gm-Message-State: AOJu0YxJ8OFKVi524bKg1HGXcAlWrqtOLC9iPzdFX4atWRc3kO1rHa0P
	988JFcO+s/nnMg774ksZGvpfN+OCulXw/Uw7CZN2OuoXijim1l/RVma4geTjeN8Wn5OpHwM0c61
	UFruDU3L5/UCiMEB6IIbCgZ+cn27Jzv7foByu7iJ1oNlIpATlHnoPU4/tRArLOL1YuLiR
X-Gm-Gg: AR+sD11gIqyjNHgCXRCWL67MtB0nvQVh+GUz/HZdkBVzqh2LekyWmHEMItGCjDpEb/n
	Tl18+r9AT8tRvozFu6zmu1/aGO5yBzysyK3obEq3tn7yZO58L2IWBnxZ0sKcjVU2fNjen0c2VuN
	lybxeDVkX+0+lcvE1nuggO1QyDSgiCjGhvmQ2DcnZpbG0VP5hE1YymYx03LMdVMTCWTBdq44Nz8
	g3asBBf4bMwFEjNrkeX6IY/+5EpWFMvLqXPRrKSuS8IhaGPexoTtlFslCYWLcbPgxCfiwFiY0LG
	qNyGfulAu5aj6bmGxAV7HkU9zZLOp30IOIoczMNrMREmXZQYDvrDVlaHpCclXGy0Lg0nPauJGCy
	n8N9gqb9E6P8aGEBNHTm4vj4A
X-Received: by 2002:ac8:7f51:0:b0:51c:7b11:41b0 with SMTP id d75a77b69052e-529d716e501mr9192281cf.76.1785223564787;
        Tue, 28 Jul 2026 00:26:04 -0700 (PDT)
X-Received: by 2002:ac8:7f51:0:b0:51c:7b11:41b0 with SMTP id d75a77b69052e-529d716e501mr9192011cf.76.1785223564234;
        Tue, 28 Jul 2026 00:26:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/4] dt-bindings: arm: qcom-soc: Improve validation of
 expected SoC naming
Date: Tue, 28 Jul 2026 09:25:52 +0200
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQU7DMBAF0KtUXjOVZxLHmBX3QCwSe9IaEZtm0
 ghU5e447aJdlIrNSH/09f5JCY+RRb1sTmrkOUrMqYT6aaP8vk07hhhKVqSp0QYdhAm6mEJMO4G
 DzwNI9pDaoTyg7p0N7E2NlVNF+Bq5j99n/e39kuXYfbCfVnJt7KNMefw5z8+49v63NCNo0NoEc
 oEabPk1i2wPx/azFIdtOWodnOlKWm0fk1RI7GxonOmYGP8gqxuS8DFZFfK5J2u8C1WNdIdcluU
 XloZq9IUBAAA=
X-Change-ID: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2327;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jI+pMVo6vwrYZtjOru0QK/xwdYDWa9bJ5ruLtvL2BeM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmDJDQb2GVyeoSSSO/sF9nQtaP5ZT6pBI/IW
 /5w/ubDlOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZgwAKCRDBN2bmhouD
 1w7ZD/9bm9Ungs48Hg9LN8ZMtsGqFNmvWZLM1OSKFejgowIqRsbYjR0IH9fsPheOr8UGXv1v10P
 dAIUqLF4fN939QwHFcN0wARyr7JB7DD7LRbanxp5LYfIJ/7sZmNSFb5duDIdcUge2s8nmwhX9X4
 LWfTFBQSpR6Is1O8Y5/Y+Pee/wRIIovHpCszFvgjbklBXCCiJBK9Yvye6ij1W0D8fkTyzhjNXM9
 0i7hmFbu8VdwaW/ZfbWKaAO2Xj5JGx0T/mzjMZh77PgMVpBNJW0CTcWZXUFLZ10BVI+P96MFyvZ
 N8tBY6UTDl9Ks4SmQmZWhsfYQTP+GjpfKNh/fObi+35f3XZ1jXztYneqOdr+Wp0TF+99k3r0R8y
 +T6U/OimngT7SWPIpopZd2IjvcTRHUV36ctBc5hdsjCDKJiie3WwMvXJzWNd9AhKmIU69TF/cJb
 CJ2g75Gt6V4o4fYPyADZQTcj8yl8scYYi6nEsYhuj+Fuh6dALU2q2SOo22dKI7iTZzItnimeUrY
 E2EEfRQtxdeqMkZCjHV7tgXZe4yimtSbfvGW8CeVi/LBqb/j+byZvKaMDpSqBNpNlxQyprh6uWB
 BFe209Xl1uWKvO3Y6LUCWyLa8kCpyfSsdSOtp8b60nDigv/WWr/R1xdqbRPFU2i3FVoIvZNwR0G
 JHiyfMhwanYF0rg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX2cSN+EIQpElf
 acG2ao7s4pZ+enQ5JxMKCoq1bYtjHfojyuzw4J/SIx4COut0gysbJLPSjvql94kmIY+ECQg3Ke4
 r+EqI7c6o3g59b2hGOQzXzKzNOUZ5SQoK+ADn48gVxWY9gd8IrvgIyPIt7SObQ1C/nNAJGEDWhF
 9vEgSkY8HRVvu2+K80rjRAXk6qZm3/LAw7qpTAifOOpLRtK41gOZ8PXITXvpp4PRXpjhzO0DoNN
 /IY7GiMmo8x1h/SEilj7awsDj5onDw8llyeLd/gX46vD5zk5CM4NT7Yo77wblyCalVNI+Q3X/6d
 TM+M5dGW4OfGhCQElAiUmUt/9JN8bHMbeA3J68TquZcMm1ibU5JSKkHoZ6KEunDa3o8vwCU9afc
 30wMPrkQpO5LysJFPV3p2GiIZOYxF9Rj6VjkX1CgkltApKN97ofIQxS64bZwMbz/L//n6pwPdl/
 mWdS3zmxOUrTj5tDSWw==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a68598d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LvKCfHGxsC2wBnq9YmcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: HHW9YmKgdBtLTMd0or8ms63P45cSbsSN
X-Proofpoint-GUID: HHW9YmKgdBtLTMd0or8ms63P45cSbsSN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX+na1GFO3Cftn
 YblSBDpt3aNE4EeVZ2oo2SuU3PS9JHU4beUyPBv/isEsEo0rlTRkzs8vzQALpRydZWubrSbRdB7
 EL2dwsXZIR2LPJrSqy4klGG/sQJtFSg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280063

Changes in v4:
- Do not change .* -> .+ in codename compatible pattern by mistake
- Link to v3: https://patch.msgid.link/20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com

Changes in v3:
- Extend qcom,[ak]pss-wdt-xxx pattern to cover also qcom,apss-wdt-x1e80100
- Extend qcom,scm-xxx pattern to cover also qcom,scm-x1e80100
- Add patterns for qcom,rpm-codename, qcom,rpmcc-codename and
  qcom,scm-codename (all used with Shikra)
- Rework patch #3 incorporating Rob's suggestions, but not dropping
  legacy-model-name compatible checks. Now use "contains" in compatible
  property schema and drop all fallbacks from previous approach.
- Tags.
- Link to v2: https://patch.msgid.link/20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com

Changes in v2:
- New patch #4 for WSA speakers
- Add qcom,usb-hsic-phy-mdm9615, qcom,usb-hsic-phy-msm8974, qcom,hamoa-crd-ec
- Add SoC codenames used: maili and nord
- Link to v1: https://patch.msgid.link/20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Improve that because questions about expected compatibles
still appear, e.g. we have
Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml with:

- qcom,pcie-x1e80100 (expected old legacy style)
- qcom,glymur-pcie (change to new style, ok fine, let's switch to new
  style... but...)

I am afraid that a new SoC will revert that back to old style, e.g.:
qcom,pcie-whatever-new-soc

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names
      dt-bindings: arm: qcom-soc: Document more of existing legacy style compatibles
      dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
      dt-bindings: arm: qcom-soc: Allow WSA88xx speaker compatible

 .../devicetree/bindings/arm/qcom-soc.yaml          | 92 +++++++++++++---------
 1 file changed, 56 insertions(+), 36 deletions(-)
---
base-commit: a2b553a6242618367923d3be0b06c311bcad2e45
change-id: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


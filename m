Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC63BB12A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167234; cv=none; b=kfc2T3+wUAlQUcQS2vqfGs9f6wouNKkUNok1+eD7PRXmftKc5e2GcEjC7CSemnOes3zcUqouT1884KMRprkDFXPCiP7obLtkBu7YrZpZespJzyjeCn9nLB+0m579MiXzmRPJhRAYjBo5mChNvsO2mHVha08DtjVQgHpZDEqka78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167234; c=relaxed/simple;
	bh=43kb05RaUpjRitjlYRocMlxAa/dQVEJYd5sjO46qM7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGxBcdDgPWG1su1MhXqy+LAwvT+wlJ50+si72trCd0BRSS5W8IqJKPB2te0odfLkrCJYuuksgOKJ9FqvOWr4xlo4TVNLttioVc+dhKfnK3yMnfOGwf3jISJYDDHJWo8O2s1/QZmfqn36T7xKZtrX9Kjfojm513VdaPX3e7oCUIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOytrHkc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klJfENhi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOytrHkc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klJfENhi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm4jJ4066697
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7mjFbopEGBUByQAtuhbKuVftRTpKsVvgzJfo+Z7UEY=; b=kOytrHkceeeRRyIP
	M6KMNuNHbpM/yEMt5GtmzW17+NOWCFCQg95Q9ruyJXG+QD0dyv4VURmelXqILu5Y
	DfO6sy1jfckW7sNY24bkyYYhDwMN2O/OB99dKWlIudTOPnytw3Y/zP6lcmWyq5eT
	VwXntfwk47wZeJ52V5FN7KCf8A/SlXMOt4P+juxUdVN0y4qrd8AwTOd222baYEEK
	phJauopWD+hn1mnM9Xr4geY4v1pJ5oAd8R7zsPsj+V2yqjZoCcSuGz1rKyV/S+yu
	JJCKKdFawp6AU2AbC7YPKITgKJy5K5p4txnjI50bd8nWBRlL1S2uhNVQn6IUVjPZ
	I4LemQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysvahs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:09 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-80ee3cb097eso71785057b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167229; x=1785772029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7mjFbopEGBUByQAtuhbKuVftRTpKsVvgzJfo+Z7UEY=;
        b=klJfENhimTfOm3yYxUMV2DQU7038pz9QmONR7YHHrOc9WBozrtPbaBxv0QHd7hSaZX
         YNomTKGrgDQkC5q6mbprWw/WOx+r6c9zeYTvFb9F4iKxyqSDxfyTQUZHVUa/DLrh7MN2
         S5+CbiarzbjqjktD3vMcLXRdgRQ+9BajzrJ7br9d4Ic0iosiVf7saELfAwsOiAmCpSfG
         BnzspgJn4cVSTuJSfH0BRsrFw42R7KLydX3iZHoBJTzueXVrryR3zLdYjK8ULm35oqKC
         yUJjslYaaSunnTbHrUnNH+4I+T5vksUP+0yF3g75si+LI4H7pNO6MqNhMWXspzKkYjKC
         Kc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167229; x=1785772029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7mjFbopEGBUByQAtuhbKuVftRTpKsVvgzJfo+Z7UEY=;
        b=QP2sQcRWt70EAV05gyIABvQITVY4+pF5gvLzwadKeQvfqxsyOsWCYKef/8LDA4aSjR
         eEmidvJujxj5JiSzLfiRb6ixkCE2v1QNYgYhakJFBLjYH+yFQ5akQt+DPT3M7QFXgaPc
         3xOZkIhWaNKlbFF6cT8ovxdj0u6yRfQlhEetHra5+SbcbtJAkHEIFIJMq2WnisUHSeca
         0b2FNHd/xjCBcyBsaAnezGhhtdP66nVA8IHqqgghdXOaevApOKqyU0TUs1qJDN9pgbys
         njsjsZtd84fvwNiRRi1i7jatpCXiUCD0wTkcjrrHGtuPzkAUc6b6CLhB5Yww5cC01zgB
         E0rg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7itJqDP13wXZhZFyVZa6WhoSpW+g1TqGPY5JEBf+0M5ZSr31eB4pljpEFf4aQHUsfZn9w8WctKlN/eB1M@vger.kernel.org
X-Gm-Message-State: AOJu0YzL1LNX932uXKSlMHQb1daYUYRMXN6pCmWI7WKpklgZIWLxb+wZ
	9MSYdRwSaZsWIxqL62pLer9/ic51R3r11F96Xfo7JCt0q2nftFVrQrPqC4eSdC76t9fz7FpwYFh
	CIh9a2WGB5r7ky02BAxPFdEHFGfzK9aZrrBohs/cA09pK6vSbv4fLvpkB5p9yF4WQbWrt
X-Gm-Gg: AR+sD11wooymRLop+Fet4MbjsvMfOVQB8BZitBIuxARTwvJqe17r2DNPyTauGLEG8Rx
	d7j7xw/HC3Pow9MUYPjdSpXW1zJpCxgLSVtgajLLTDvBlz1GPtf4SAUr3DPcVehEK7L/8j00yFV
	l+DLwBoqPel9Tq4lx2jlLGerdWKrvGzN3D8qJUJUjuRynZBRdzU/uLV7lsymunOHNqYPUcgDMwM
	aXn3G3jz/w7/tr01yFemPa7HonUVmLYGgS5mxdohTYmYEZMilr+TKqEy+QpylEFhP5O0QdkRUfX
	9XGJoSS7NOQwLij/6RmsbAzKal4AY7QhYs6zj4M6lVYB+YpcIC8wiD/CXdfNn1yQe7d2yE7RcIo
	RJAXRn4KfE9SrvuEVremK5fX0cy/x5A==
X-Received: by 2002:a05:690c:600e:b0:81f:3dab:372f with SMTP id 00721157ae682-81f9391cc77mr412877b3.12.1785167228519;
        Mon, 27 Jul 2026 08:47:08 -0700 (PDT)
X-Received: by 2002:a05:690c:600e:b0:81f:3dab:372f with SMTP id 00721157ae682-81f9391cc77mr412547b3.12.1785167227905;
        Mon, 27 Jul 2026 08:47:07 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657c727asm33307617b3.19.2026.07.27.08.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:07 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:15:01 +0530
Subject: [PATCH v2 1/6] dt-bindings: bluetooth: qca: add QCC2072
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-rb3-industrial-bt-uart-v2-1-2d100f30e202@oss.qualcomm.com>
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX4y75DPOrO9aq
 DcrdYAPh/JlVuH+JryLluir7UOMps9NZU4SAnRbjzCyXYS7wIsR/1ifPi+Xp/ABi17pvuXuw4oz
 nJJ56y6M9Ar0DuBnSm+QyT8j+dj3O7fFJQJBmZbfNkwTmTs5e1RbxefocbbM7ZIAXXs+aX9klxv
 a1Qm5/j/nu4fA6KMV/55uQqmWa9NNvjwmjpDiJfVngT82nQmk5UjVNhhdq9fAak3JMYV4YSXoqh
 +POI4L+4/6/YSh06+8b4xS/JtlWgsFqRP6I7MNKAqpaWWzIgG2QrcSMtgWa8NAVLBxTfRqpQGmu
 7M7JGNfuPaCJhVimmzA7AclAnN6GCIGMIsUofsanY9SHplz3YYH4NIZ6X0oQlMqE4K3reyE4aEa
 xpR81f4/xjCfknJcuYzP4t5freSXqMaWfe4YNNvjtAzBZc+OI1QnP4hlzwNf1qQjwMC+m+R4ZkE
 sue+dw1/40RnCuEBDmQ==
X-Proofpoint-GUID: 0FQqjQYuURt60PQn5Ft6FCwzJJiacyi8
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a677d7d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=o7QFpL2tXW9ehrA7-Q0A:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXxAyJ6d/jgKVa
 5UBjnShS5V7XH66IVSLDzIr3KoKhWYRSS9vat4XKw+/D2YYH25SiYjAnxd0AZL9aWMDhrbAQa4J
 4DwOr/sSvMvesISzx9laOIWYJhZAzsA=
X-Proofpoint-ORIG-GUID: 0FQqjQYuURt60PQn5Ft6FCwzJJiacyi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

QCC2072 can be used on M.2 E-key cards where the card power resources are
described by the pcie-m2-e-connector node. In that setup, the M.2 power
sequencing provider creates the Bluetooth serdev child after matching the
QCC2072 PCI function.

Integrated non-M.2 designs need board-specific power resources. Document
only the compatible for now and leave those properties to be added with
matching driver support.

Document the qcom,qcc2072-bt compatible used for QCC2072 Bluetooth
controllers connected over UART.

Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
 .../bindings/net/bluetooth/qcom,qcc2072-bt.yaml    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
new file mode 100644
index 000000000000..e4b281ef261f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCC2072 Bluetooth
+
+maintainers:
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+description:
+  Qualcomm QCC2072 Bluetooth controller connected over UART.
+
+  QCC2072 can be populated on an M.2 E-key card, where the card power
+  supplies and sideband signals are modeled by the pcie-m2-e-connector node.
+  The M.2 power sequencing provider creates the Bluetooth serdev device and
+  uses this compatible after matching the QCC2072 PCI function.
+
+  Integrated non-M.2 designs require board-specific power resources. Those
+  properties, together with a static devicetree example, should be added when
+  integrated non-M.2 support is added.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcc2072-bt
+
+required:
+  - compatible
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false

-- 
2.34.1


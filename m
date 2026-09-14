Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83AF47AF43
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390109; cv=none; b=u/lZ5fVzPBqXXuzv/qFpdyoYaHKzfBhw5kK88G7zTQNE3UjIY8qx9qfFXJ932lfyh62vbK+aG8TgE62U+W9orapgT7ygrO2mVPfc3kD7GIzvoPUOlu3c+DxzQLuGU9VlR/czAj/CxURblFjVS+ymW3Eav6jFGYSnXFbbgoMwqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390109; c=relaxed/simple;
	bh=JgJ2Wl7jzlPIHSp8kUuES5K32znNH/l+fUnBFdwTqGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZsogI5KSDNwnMT+zOI1KWp1TWoaIiVYbvepkOnixKjWWoXE3TIhKNHOGCJxYjkHAm7JYhaH5hAeNBVRyOWSgba7GoLleV2Pn0Msi+S678ggmELTkBx1oH4uPdD5uf3410b90/TO0vOj450C6Om0dsv+vTMiihV+fT1Bub4KB1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXjuKNQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6CbJMuW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXjuKNQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6CbJMuW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6Ej3793274
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0v4UR/PVGKSxgKIX2GyxHf89EKqOMPEeK9Od3LnLOo=; b=RXjuKNQJnWT4TCsF
	M7PhVbPPEQ/1A9mqaqZYR9b7BH0mO9mqcpfltIm5PDJJIbPftOJROCBmgjXK0nxE
	bWBrgI0/wtJWqymztyD5KMJXtC7ySxh1F3AV9pIDIP+vHOT1dNeRKP1dE4aqJhkU
	/znC3jdd9INTYDioTfbLU17pwdnV9kM/mmoxeY/30oQkraQhCMf1tOrPMIclbAfX
	in47zSAT2V8hPECFTs21o1wbOk/FI5WE/Fy+28zXG156ggDb3PnSMEqlixNWajuW
	p5YVpJ3e0fWM+LMq3VG9YOXwGeTNc7HZ5QVToG8PjeyxwUlkQK+89TgkWLjo4vZT
	b0dusQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg15us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e80ce3597so77419226d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390101; x=1789994901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0v4UR/PVGKSxgKIX2GyxHf89EKqOMPEeK9Od3LnLOo=;
        b=W6CbJMuWKXj+vz6eIZqsZtaAJWTcy7BccrvhFqFp0Y26saxCgh390cc3sJ+0pCw+8x
         ybjwcSRj1JUx1u9pz1DOYbjDQxTCeS0stAUiy70p4Aq87Xqwl32U66LKPWFUjwMPyxgM
         NhaEAzfOSN4by0lPvK5cE3scOuuev0hwakfc+0ikQJtAVvpOpQenihcJyFriVvb4x796
         Bx/U1FOmXaaZ0v5fOhk0s47wBBXrBpz2YxcMSZzrlpzjUWeBHZ5DtP3ehfW41mbT2A5z
         c9omvZOjWXB9KWuoJaIStL2upOe07tlKV+iwRJYdqDRQkzM+yhjRP3Spb4HJfa8xejrz
         CDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390101; x=1789994901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0v4UR/PVGKSxgKIX2GyxHf89EKqOMPEeK9Od3LnLOo=;
        b=FCXhqaCZ+DCRt3RuJG3qUksAp3gVBAuFqSdYaYxaXMDINJdKFv03RcXbT117q+SC6K
         rD1nrVhInbH6h94lByw2qVb00yguM1VuNtIs8LetJ+0XNduFIN7FU1OGTlRS9M6Ogyk8
         nJJkqib50X+N2zgVxCLOCuk4im+RKGf9MHwP6UoMyscSLd5kj08xzWL2FnHhc9Ae489b
         pcpqaj1DXhxGfW6oIDQS7WOVtirvqmpjpvRF+C+SZ5tcy4gZi22dHT12oP0yKJsdoPrs
         GO07TUQgQ54XKK128RGSpIpNTVVNgWucdIzIgZwVKIUIwTlrB/XfEUF1Y687Dat4WWGw
         g1yA==
X-Gm-Message-State: AFuF++liyhyt9qM6AGqAjKEDfJTNf5BIIYoBeabbljwIY/DhVWJKyhfh
	ttkytAtJApr8mApbeoKbXAt0XQUqnfSybVVCygkbF5F10JUX2qPe5KGI7UToC7br6LJ79LxnVEd
	dHImEp9LnHL0YMXFWUBiOSOgGiS9Ryye25FwdXgBD1Y6CBSHWIeRjo3y20gK/zV3s9TUV
X-Gm-Gg: AYBFou08Jm6Ld7R+eJuFFVpC1cW6rxAFH1sya4+k4KE0+21H3YcWWcht29pnOYg5RBl
	ncRvQ/ZRAoUNsmuLC3kFv3sutDqPhnbgNULfwYvK4dJqh1gGPbljUx029jFBWfEBxE64JvJtkuL
	7jvuWBz4g/CR66UArvCXkzXXPXYMQ6Bm6iAXUiiy7+fBQ+bt+aC4Wy5TwoAuXRFcHoPusAj+usG
	JdYuBd1rf77HsjwAdHM8yPDXVVzsPI3MmcEpkvedhPVFeGpA9m8bG4fRlZsyEjIzejauHC2Q2fW
	p8UX7Til8qCiqPXSWO3vW/KJNEaX1uwxn9gg3IAbaSlZfivLC2yZomj6V/9rS5E1GTZhEbJZaYs
	O8i+IaypH
X-Received: by 2002:a05:620a:468c:b0:939:6de9:4cff with SMTP id af79cd13be357-93a29bb830amr288662385a.45.1789390100831;
        Mon, 14 Sep 2026 05:48:20 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:939:6de9:4cff with SMTP id af79cd13be357-93a29bb830amr288658185a.45.1789390100366;
        Mon, 14 Sep 2026 05:48:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:06 +0300
Subject: [PATCH v4 07/52] dt-bindings: clock: qcom: sm8550-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-7-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JgJ2Wl7jzlPIHSp8kUuES5K32znNH/l+fUnBFdwTqGA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zSqDpevtnciKIcB8tBzq9yEukQYD/6XXOge
 qpjs7OJvUKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs0gAKCRAbX0TJAJUV
 VntND/96MfgIouranaZDldyBr8QqI0B0gtXhl1kB8idf6cwDlA9LnWHBO25bmgZtNMN8jqjGvHX
 IK+5CvGj8FfS/pJlFY6uenhmdS8BjKI/uBT8Kg8WJtcL9u/+BB3tYORMc38NTub/uUZ2DFNbeAc
 qQ5CaEvH7848yx9LAOxb3uKrKBj6kIIdeInjJq6K6NElh/sKSgzkdpqF5LdJFubXLC+K4XwSMhP
 4Dbuwx5jnRg7eMb2O5ZZ13gROutENrrFrddONT9dYxGsnQXjIxpbiGXtXjPVxPn7j+P+hKSZdvL
 T+Zr9k/K7j9GCUsFDswPa7/ykbzONEBG3DnspFW7xnT9opsN/Ys1rEF706yNXhdNw3GZY4UQJg6
 2PAnTobDwlyRQBjjLZkpjYgDREprgo+xPMZtVe6mqnyy/ebcGO31zp8FjS5R3yRLKL0GiscqDm3
 wpY7K8EXEQOemFqzRFRdWqMdWPuV7/NVlEFVSmjC5g0nPDt1BjQVB9xvrWzmrT1P42S+wydolT/
 GLusdC4/x0t/XBIsiNs0mzeyJN0Eh6DkiVR/O7hBL6A6mUHJj9c2DnkrjL0U/NhhuAeXW6Rq+SX
 6rPm8TBVbBt1WMqe8vkbknxNaFSSuqMBd8tPcxfXb3VX5G8cAWq/KjKOEvg8SyCGRkdAXIWrrsk
 TaD0q/ugRLq3PkQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ed1a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: c1K8TD7D0sQa1KPtkY6WGbZzFXPcKxcl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXwPSZQru3YAru
 c0Sl14J+uJC9lZRuL77FWR5srjTZlfe9mYJwhoWk7EPmeaO0AmzqEtK2L5MJePdZoWkt54IOuwf
 ivN7Xa5BMf6ixTIo456Oe0yJrO7kROE=
X-Proofpoint-GUID: c1K8TD7D0sQa1KPtkY6WGbZzFXPcKxcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXyaZPnzzoytwl
 Xy8yiJw/wlU/M9Nan2PD/Q64UdXt9AHr4JnrM+tYzq8bHyvEIiKBPoIhlKHB9uN6MfUZIKQupp+
 Pp+ewsP9/A2KD+b1bjhnv835drG4DCMbpPB04ZQcSSD995Mu5JqCHADTl7XWUffLNyPxPY7XOro
 9r8YXcC/ihW98xnedn+wroCutHmzvHRcra62NKvrsSQGFdTwzM4fMDdqyTUzjh1VYsaxmAh0ssW
 KJFUTqEtlNbW0muQs/woMWqJKtv/EPDpNKSbIBDXBWu9p+gVzft3mHojKzJC6jf02/zv0/Sqpn0
 6cxHRuWAFAo6/8H1XzN1XT5j+hhqDEnvd7/0xRJM8tRt8/hIL9WLsjJSZTsEkFFgwCDqFjUTo0G
 IDb1qGISwa5NL/Vn7BcMhYFWxfstBJ57598TTQ1NR7pw6uxabjJbwsDoEE6EMiYZmLIac/V/lPo
 BJItmnvp4Va+mTfnVXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM8550 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..f9423aff5dea 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -44,6 +49,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8550-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -55,6 +61,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0


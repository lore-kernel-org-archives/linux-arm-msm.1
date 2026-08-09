Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E43AAF45
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 20:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306551; cv=none; b=ZFiLeQ2a1Tef8lpAxOY6++9Xebvo3CBaLd3N3ksmGff+UR//jtSGvPYBOotCVrhr1kl/Ybhfuj0jwNdy/0zkyf2t4FMsiGrh4LCsvGgg3+x14HJjdGiw7SHQCwph6wg1RaVWL5yY46nClKh7+02uXl1izxarT+JzJ8Ak7g/fSwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306551; c=relaxed/simple;
	bh=JQ9sc9byZNSc9Sh4d39mWgKgoacapHogPOICv0zdO3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYI/pIQGZo2c7dMEs0QBsado2cEGQJxrZ762z5cLEUjEca1tQkUcn858VO0LGG6N8f//KaBCLvmBaAW80izzFtmcy3ekXLxOidchkabS5Qq1FJmuavspixplcnM+2hhYNSu0amCUVKTkG7/hIEkX5VUMuAUiLPj5l7qHUlZOYbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b05br5eE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuAtvaff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b05br5eE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuAtvaff"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679JhuT93922000
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 20:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1pPMazMPEW6NPGoSQF0dXImkD3ATvdg63Q5ta3NC/0=; b=b05br5eEyxbjo2lB
	vkwKNNQkYLVBwgrvVl8DGcoNTzahrx4zULZnY4FieVVcnL7OBUkV0slm0WZDM9WU
	xfzg+n1NXrINvKMoEQa04DvH4SXANr2GxZqXQql8CYsSlly0lCN0NsbClVvFwlab
	9NtT61qkz7bgzvpALvJ+ouhZrND4iopLsqSbegoa0RpaWz7mufThhKUePLhWKJ/y
	kGIEfLWgqzvHPKFKT4bA4nQCdLIUKFv134hGSLH8AvO2uXXRGexUHBVDb/c3wqos
	U18odKwagBOInGCnvJoqMapVjY6z7QfzYJV0xDk02zle6E4kNxNJxtgecxaRZBsW
	K8saGw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwv1ybhj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 20:15:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so26968996d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 13:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306548; x=1786911348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1pPMazMPEW6NPGoSQF0dXImkD3ATvdg63Q5ta3NC/0=;
        b=cuAtvaffNODMT9RgqLyqo9azUFHvmygX2SM0V4HX0W8QfRCo/vwUWBIdMyMdiuIfFn
         GTBx5ITXjCwUdsapd6dPAkMrlUA/e7uP87v4Od9prMuTOXrw3+oG69/VD4eFWMwVmi6B
         f28J0s24oHvRp8QfkdXXqGYSBZSCDMHydx6yYh4cYcWIMQqp/yeWxxNOl1ukvoQGLfJ3
         OiCpSOzLPtYQE5cXAlz1rkzAdUaaR3E8Zrd1AwnHP/lgGIkqvNeLeJygH5dlai0V8qpA
         vEZNJXzRLCchs/4y3ojipsDatbZEk/LOFjCLzwl7oh0OdVQM17C/LCoXod9ckGYAhsvr
         cv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306548; x=1786911348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1pPMazMPEW6NPGoSQF0dXImkD3ATvdg63Q5ta3NC/0=;
        b=J6Oq+Yl7UMvhxaoa6owZaJZRpitPEmSakDCSOurC2LHXm28oQp5Cu+4/Rlle5Y+jqA
         ApNGtXKEcIuiISA32SRVy76LPJrrUFahU4FRh1jqLytsr3bcqJJU018KeyRImoIsgT7H
         NKZtJObFccB9lVmC27zRllOOiZuq0ffFiDfwvuD2VYBhWYgdtEXOhyRpbX2a3pQlcc1l
         QnY763PPOnqRk57IwuhQ+vGegPetMfHKZhdvJVRfYPw/gwBnaHiUUz2YPCAKHqffJ77x
         /X+h0lKs+k61F0Lqw0rVVY2PhljBRzg6aXy7XeZr84kqP5Q7t3BJTpUZ7+t8+zG/xfPU
         TQJw==
X-Gm-Message-State: AOJu0YxiGj1HbUvSeZFa1GcgTLKPYyErX6KPOhUN+FZo4kI9ovnQ7wM8
	SmS1HETHZUty+KgNylNq2311Q+aa+lQn88/lcGVM1n5KZJ2RwzTG6tarTJ4uOEM3YdSULu/GbFn
	bWcPibnIBkAj6WpoVcYsbD6vgZ95O2K7fL4p6YQjHgOZtp8kJVFMDXF9zlUXf1jKPlIPC
X-Gm-Gg: AR+sD13irD686XiVucVVZ6Of9uK6s/3NFUgqPlhKXRsSaJv0bPrGsO2ixGQRtMro9/0
	cOj7P3T26RFPC8nTbRreaykd1T5MxgeV1vVOCM37DHW3ex9YFNdSucTk5chUQOER/C83GOyh9yO
	RUfOPb7FJ9s/OxRI2BPmj54ghPVVUne6el+kZ6+tYvdwR8myW7O9x38Su/7FpXLQcTHat//rRA/
	0wzf2eVbH3QNwopgXkc5aDzbatIVlEcmhzYZ7nH2g/v+thHcM5UK1GM+MDUZoQYq+s2oDqWWvpd
	JksfTPVuj06qQJhYL6FJhRoof9TrP7qHl29zqntlvkbw9z8Ukn14bITppIO9dTDaQ+UwtUJodVj
	ZUVyuYgZyvkv0quIjqWpReDRK6FhU75uSDvv+rsndqK2TsqsDXWLx/KVFwwd9ghgIawtvjMN3wC
	N3yN805XmhkuATtw==
X-Received: by 2002:a05:6214:b6e:b0:908:598a:91d4 with SMTP id 6a1803df08f44-90a366e8fd0mr150744686d6.8.1786306547757;
        Sun, 09 Aug 2026 13:15:47 -0700 (PDT)
X-Received: by 2002:a05:6214:b6e:b0:908:598a:91d4 with SMTP id 6a1803df08f44-90a366e8fd0mr150744306d6.8.1786306547317;
        Sun, 09 Aug 2026 13:15:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:40 +0300
Subject: [PATCH 01/12] dt-bindings: iommu: qcom,iommu: document the MSM8974
 IOMMUs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-1-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2499;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JQ9sc9byZNSc9Sh4d39mWgKgoacapHogPOICv0zdO3o=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1bF/bef/f3CDXK/+5ouUjU9mzw7PWi3SuSf6gyzdXl5q
 a2RK5Z0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAin5rY/xd9c1TWm8y0y7lO
 2eOo2Yu1y/yuHEoNX2Zto5nZ8KhuXsUJnmK5KQt6LqSy+bJzTg1Y7HQ9O869RKL2xrmJwiy1fse
 Nm7bIuKqlCnJ/EjpmEHb6ifOB4L937O/veJHS25J9v0PxzOWbp5d86FbQlNGQ2V7ZpimdxPAyLJ
 91jUjnAd5Ve1aVnV2orPNJ7tunRHGWZVV6X9P9ZsfGar3TyZp86li9jLtfIhPbJh8+475rBZcv/
 cp6+t+0YwrXNL83ZRJc/Pr6rK9mbs5gexIleGFJiKSIrrTjikspP38Z3M1/wNY3g2PmJveU/z+N
 Vz2fXNrusrfKJk1cUDnofnyAsNb0ryUW/lZet1v5P5cAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JagZjAtuqEx1Y-ZtEgopY2umlfaVG-xM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX4h6id7IPLn+J
 c2z5By4S26VdN5NYmgYuydjcfIKfIE3bO461xJCBi05iPmTJTx4bUkh3pnbyDfOWDmDnr/nANFo
 6IiEld8XDg/SC5yw8hOeDXX9Ao8ZQGXwWlr5Xp+4yXuqjxY9aG+9S694beDlOY8hvrTuhXmag4O
 W4Fo434WpXq+DjiGskaVuw0EOrJh2mZWKIwrTCDgvKMbbSaShXJ5bI22Zs/Ca1GNquaDSXzASQd
 vGp6bABh7B11JTbl84IHyNTW8yf6FfLm25SDasRz4uHGL3L+w2xfk3b8fmy9ww40eKBYCXobUwU
 jt3/+7Z/8p39uRISjZPbHHXfdDcQpeno8Vw45C63FOAAhWBZMGDLs11Sse/Lcdaxfl5SIcHcIdZ
 O23DN1po2kVTnYfMNjiFJ8Kpe0mywSMBmUNha6xxZzTxJQtbfHwCivehNSSZNEYmO0xov+3Hzyg
 +sup6Pn7UMH2WtRz3VQ==
X-Authority-Analysis: v=2.4 cv=PbrPQChd c=1 sm=1 tr=0 ts=6a78dff4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MlIQwWTDgEZjFnBirR0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX2LeQCBCETyHG
 Lh0pFPngfKVkJmgo6nr+CENg3bEYdbTeXwKbaJqkpVXWv1/IOiDLbaz0r3a+eMG6aMPL8jR0Mct
 dMYTtuZELHOVXPsuY1mVSWFjVx/84qg=
X-Proofpoint-ORIG-GUID: JagZjAtuqEx1Y-ZtEgopY2umlfaVG-xM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

MSM8974 has several IOMMU instances, based on ARM SMMU v1 spec.
Nevertheless, the combination of implementation-specific registers and
the way TZ and hypervisor protect those instances make them not
compatible with the normal ARM SMMU programming sequences (nor with the
MSM8916 and later programming interfaces).

Add per-instance compatibles for the display, Venus and GPU MSM8974
IOMMU instances. The per-instance (rather than per-SoC) compatibles let
the driver carry the per-instance prefetch tuning tables and stream ID
maps, which are not derivable from the hardware. Document the extended
meaning of a missing qcom,iommu-secure-id and of reg on these instances.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
index 93a489025317..43dffe41e3b8 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
@@ -30,6 +30,10 @@ properties:
               - qcom,msm8953-iommu
               - qcom,msm8976-iommu
           - const: qcom,msm-iommu-v2
+      - enum:
+          - qcom,msm8974-gpu-iommu
+          - qcom,msm8974-mdp-iommu
+          - qcom,msm8974-venus-iommu
 
   clocks:
     minItems: 2
@@ -50,13 +54,23 @@ properties:
 
   reg:
     maxItems: 1
+    description:
+      For instances using the qcom,msm-iommu-v1/-v2 fallbacks, the
+      optional "SMMU local" register region used for interrupt routing
+      configuration. For instances with per-instance compatibles, the
+      SMMU global register space, used for stream mapping configuration
+      on non-secured instances and for the implementation-defined
+      prefetch registers on all instances.
 
   ranges: true
 
   qcom,iommu-secure-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      The SCM secure ID of the IOMMU instance.
+      The SCM secure ID of the IOMMU instance. When absent on instances
+      with per-instance compatibles, the instance is not managed by the
+      secure world and the OS programs the whole global register space
+      (stream mapping included) directly.
 
   '#address-cells':
     const: 1

-- 
2.47.3


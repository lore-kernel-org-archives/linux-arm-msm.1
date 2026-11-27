Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779831;
	b=RAJCbpcjVfnC6wL8YvTf00ZGGxvzOwQwuvkDwpPqX+sgZ6l/GeqJDkV28KU0uuALWj7A
	 GJsCv6pFFbFZ3GeeLmdULApm36pbfArvuV231AZ6kBBS8uxHyiDOM3FHN6+kotOcfcjCk
	 5yAVLwGgMkUXOREDXykgmL3g4zZbb0jG9ZVozFIhqrMOAPCGjavXTOCNhVdLv7MyopcWD
	 Hw0gJwh9yVBbayYZgN1Axo8YLDCP6aq3S6qyfwACQW8F662/XeOMdoLJyBIT1MLfrHUgC
	 v7rUuAOtEp8l0KRn8e3wCv1dKeO7wjwVLsfA5lkm8HUiTMcvft57NXqywvyh7+yMPRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2FWKC11Q8JRJxyS1O2rUXDgWS3Xb/e6DBSv/HHDpm2M=;
	b=2Hl8S41Q7Gh8t+blXNxBAyktMgNDK5ah/cPLxiJJ09j49ws92JipD1s+1WlKGDWyPhFQ
	 QDdltiVyrJcpUWF1j4O4tKg96tmNaIv4PoAGJNd1oxglXkmkTzuNWS5ZvWtS3gntkDSON
	 Gcp+DiA5Y+ZkXdk2873GZKb7keyl6DymfUPBa/RUg/gl8EFEgEeL7VqI9Tx7IKk54wr4n
	 eZWfaUSxAGy69QHAgOyjgV/63N6ghzqrv1njr2xWtecR80j6kXuJRAUX8jSG0o6GJGjQn
	 B4kXCyi2X13/M9RuHe80vb4kOu/2zItwxjjnQrvJerXi7x6aiGoEXItBzxhh9ZTRv7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V00wB9Zs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VdsMifOn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13588606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13588606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V00wB9Zs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VdsMifOn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApBUn2677177
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2FWKC11Q8JRJxyS1O2rUXD
	gWS3Xb/e6DBSv/HHDpm2M=; b=V00wB9ZsquyiB/MvUSl0UpAYI3bR6YQ6VMUBCJ
	yDy8BYmFR5LXnM/kw+FUplzcR4vnTzVbLYSQDPGK0GIcj+0b5l02NtDWAoYO8ZkG
	H2T8p77B1P98DC2krk8XDcdaYQTTbm8e+Hu9YKcO23DzE6XSMUO0hF3KgD8kzW+x
	Ya8BJT5eLQ7zz7GS7ZcAXIji9jWC5MUhWaNddOehzBpskjwnni/wEUqBT5S88K4c
	aGN7Fj9Ludv2CP8BH9Vh6PZmTTea9IqxVIiW9JuEHFr9YoRys9+fZrmZh1MpbE8C
	ChE7FA+ySIoIrBuKlmZm5wS1BU2XxDmnLvC5D+N2R+1L5ldg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh97y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:43:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so1492677385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779829; x=1796384629; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2FWKC11Q8JRJxyS1O2rUXDgWS3Xb/e6DBSv/HHDpm2M=;
        b=VdsMifOnsnMJUEnemlJjRXf6LYQkmbusjz302sgni+NA97LOsu5hR//KhDHfYVAG+b
         lsrYceUmR9ITSyniB58dXsqhNTJKP/yFfG1vfUWlojchLs3pfSZ+ykXwThZ+zQxSeEt5
         /oAuYV+NFMgkfCgEF4CdeH/WahOSuRkm/djF5mfleJp/dNn9taGel0W0SbBNJFrGaKOL
         OLvy7a6NveNMktDsB988QDqd4NuKl1U6sCm7k9XemCs8D2FDLZ4iDHrHc9VXGmfgGly9
         YWoRSYC56pI1qdxy2UMNqXgOmQ6esCD56i4V7Ijxh/svwiMl2IwZChPynW20N+KGCsMA
         oiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779829; x=1796384629;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2FWKC11Q8JRJxyS1O2rUXDgWS3Xb/e6DBSv/HHDpm2M=;
        b=0SJXvZBNZanKm0Q40ZUVIOtlTSE93WW/IC7E/6zbwyjPnbpYf4UNlFHb4bTdujdEZC
         W4EMDZF2YduyslohrViFvqCqwrm5bPRe7qXXLFRl+lvN6B7PcWc8IWcDpXi1t7dd4qoc
         BeyzVTRo/vHS+wlrjD02TWC41qY9sUtPNTLhWDMOlcgJCz/1Mr7dlUPLR6lG1GRizTAr
         vu1/5lBN47nkna7tHbEHELXPYS524Cdr04KOGqRWAe6Vtn2vy0b3Kvvkfs1lEhh2xFSR
         JUUAxS1eatujIOw4kkLEx9JrxHwyMQ55bSgS5OkdV/nTmSJmqqs2WVRZGtlCgg4qP7PV
         B9hw==
X-Gm-Message-State: APuU4Z9BnAsGkYjCgg2exGToFz2NROsf68+DyBAJ+Wm3MUGCmvEYHSfi
	XTf8oxd9mTdpVVuujMKCi+JkV6hMPH7g7YPRVQJVXx+/70SE54B0FE/NQQNlTRXV62QLFKukunB
	aNNRHJl4iNqaJouM54U6zb9EITa049gwdOyW/KAY3aymEdzDL/30bhxlwhGyble4V4uMs
X-Gm-Gg: AZFdTZeYbVkQH4jxH0Blt7EXA3qzO17t4isVrclqI/zPLnSJpSzySPbXPSf+aU9Kk/4
	S4a4nD7THb+wJ+tRrvcLaUtW9HPCtx59HYXo2MgMY4gBV+rrshRkPWJgcRMM8ek7AE+TRAlJtx6
	ZiLJi9y3i0vFDdfPQ2nbRe/hqrlDTggagJP4agGG5hK52o7txtoH1OyyCyvUzWb0CymdBAK5aRu
	xDDiTYCDag/X41ZiOxa+tZwyYBoEr09myKnD2Luq9oCEKbq8ppI1kMLqocfdcz9jDU+wol6WDIt
	ANZYkpTrL9nVfHMtl1Qq4qK5qbCkHmz88SAq4k1OktWRObXuqbYvj+A97/0snmm6K88H2gwqBSB
	Ibz1a+3A3TDPC6mVRMcHNZKHFNCutUxIuJUOjPTAlTyJg+WoMjvgNLJwlZPY0ZevmhfUu9HQR+U
	JMh4lAK/yLCOrl8kS6L5OoAIYjdJdmKF+cgHZ+aFH1ohMCwWaJsA2X7HXa26TKHvc=
X-Received: by 2002:a05:620a:46a9:b0:949:730b:53e9 with SMTP id af79cd13be357-949ba98d292mr4242566285a.31.1795779829427;
        Fri, 27 Nov 2026 03:43:49 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:949:730b:53e9 with SMTP id af79cd13be357-949ba98d292mr4242562185a.31.1795779829004;
        Fri, 27 Nov 2026 03:43:49 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm38340537f8f.35.2026.11.27.03.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:43:46 +0100
Subject: [PATCH] scsi: ufs: qcom: dt-bindings: document the Seca UFS
 controller
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
Message-Id: <20261127-seca-scsi-ufs-v1-1-4af7bb40c4aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPFsCWsC/x3MQQqAIBBA0avErBtQiayuEi1Mx5qNhUMRSHdPW
 r7F/wWEMpPA1BTIdLPwkSp024DfXdoIOVSDUabX2lgU8g7FC+MVBV1cwzBGtdrOQW3OTJGf/zc
 v7/sBPCqFvl8AAAA=
X-Change-ID: 20261127-seca-scsi-ufs-afbd89f0b74a
To: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fIatVXM2YMo39/HpbLiSCfTsiSk6gCOVc/Kg3EAaVIo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWzz3ZCSNuHPktUMQlOMNuBxnVZpxVX8rpwUZ
 +QSWQaLzL6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawls8wAKCRAFnS7L/zaE
 wxarD/4h62VN0p6xtqzVT30rV0ZldJpxzPlhGL+ar5plW0Nxj6Jj/oquKk3A5U4d8X9qmZsRX/B
 x8b6e+eD1vBxVbi9ynXsSwf2meZXDUSL2InmBVBrzBSfSJkotelAoEC9/Nzxxhxd8TBEu54rlRM
 p4oRjlHF+z5oBb7PnvzUka0hH4y1nvYmmoGP0zuypnDk1DFsXFXQe12foqv+/n3qYYZY0i3j15O
 o/7EyR3Yv4BM3Bbi+wSBwLT4mizoxkhv2gGtBoGxBBym205Z2aK9ZepaPN/k1g6vG9qn3Ej3ur7
 7LTmdEB1+tkJS471QY1bvPTwmnFuIUyD56A/VWX2BHcol12v5+5fViV7uItodKuZ5S3jK246bNO
 l4hSbPOdlt3ScpaAKc4Omxuq0Oi8jHBns3JyygOfE1QldLeGXQnH0+Kh0z/TI/iy203Z0ivqG7p
 KFMFDqHlgJYeMY9d+j3y59rRw3Tyeb7z8ThwnpyiGhXXhQi2vnQNBFlECG11OX2SIKbx7H5H0MF
 Vn65KZHdfO197guJ6rxxKnhpLQoDOn2VC9oUm0gh3Fh071mkx+kmZO4T+ui6Kzgyb1aZCD01zxW
 NOqytgtsf096E8am8R97JYjib/gIvKFWEsWpxEHcAdmjzgERDQt7cqzGbP2WcnnfqZZU51PZre5
 AYb70ucF1bbxa3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX+pMnydUZAO2Q
 HbmGyFO1qDvbEMU8Mdo46/3U/m7jK8aP9GLqGB7jEYDDP68Mren/rOwXvBCjw5sS9a1zjsg4JWp
 bKAtvIS9CuK7Mwfa2ONic0P+V+zruUU=
X-Proofpoint-GUID: JoCblw5nbtm8tc84Eg_oj9wMJPQa28RN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX0W9XHgNz49oG
 nWg+xS4cIstVWqkDEEdZj8U2SyjU0Qnc2GqoQLMYN32iCkMrnmPnuDL1c2bnd8XgRj29GLTZPEI
 gmOZpodkxSFufUONTLd9FykkAzrOzomJpFDQwXafC1a2BSShxsXQYDHpwMMKcBLtHZWggvLJ4+E
 Y/3rqtjebn5YQ8ByOoMTPyZWqHXFJ05voPLGZdlmUsSdGfIOKSclJulVmb9dYxdZOzM71nXrmx2
 smSHZx7wGlcVpay8j3lbky0bUiNS89pplTTXsRCMHbECvGRLy3n8hpXJ8wsIvlpK2Ytd0NEuzwN
 28NVR01UXB6iheCpqNg1t/338HRWrVoqZm0l+K7krRrlS8X08mT5luFbfVLCcyuzkB6R8VWDrM9
 3QZWqp9W3IctCk+2zFbuq4Hnc5kf3+PLssyuIBfCMsh42e9wy7WAjg/Ts2syaZR1Szyrxsc3woT
 0bVtCzIBaDdwxOU8xyg==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b096cf6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=dQ21c57GlSjXnCoPd7EA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: JoCblw5nbtm8tc84Eg_oj9wMJPQa28RN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270046

Document the UFS Host controller on Seca SoC. Seca uses the same
IP as Nord.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f132b1a9ebc28165ebf3f3b74c7b110f5bddeca5..511de834e1c7bef2ccb7f49e0ea193353cb9dd92 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -21,6 +21,7 @@ select:
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
           - qcom,nord-ufshc
+          - qcom,seca-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
   required:
@@ -36,6 +37,7 @@ properties:
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
           - qcom,nord-ufshc
+          - qcom,seca-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
       - const: qcom,ufshc
@@ -85,6 +87,7 @@ allOf:
               - qcom,glymur-ufshc
               - qcom,maili-ufshc
               - qcom,nord-ufshc
+              - qcom,seca-ufshc
     then:
       properties:
         reg:

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-seca-scsi-ufs-afbd89f0b74a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


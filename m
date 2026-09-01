Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA1474252
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250092; cv=none; b=i+E9auQYEJeSl7pY2lXRvDZYa46kMoHj8YtMYC6m8SipEpf38KmUBG2ezz+8/M5tqLF4++v038BnOPOIbzpG6ajUAy/NEA65dXaqaz/OT7nAI4dZix/ETmzIMPQamRsqqH8oVJR1HII6WIJ01iWGO28FpAPe7hN/3GojHE6wBDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250092; c=relaxed/simple;
	bh=sBae8R0vKEkozIUJX0qR+welSBPJeruryo4FOGtusrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8Inqw8RRF7F8gx0OiEnS9KdHLun8XFqclsTLPsVPlOAf1Sf8Hpj9l42B1Uj0tceIw7AZqXBx4B76lrk8zp8SWv6f34jW64wRrgk9BRncZesAOn4Pq+BdySu6LBAyG75dYeM+GvQP8yw6OVlh1FaAKoQNFRheMLvp4SrOBBcqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBQuU6By; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aS0khBa9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBQuU6By";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aS0khBa9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Omi1282789
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duCBHsBCta3oYMOh90c4POqqhq50/eyJ3BOcaXl7OIg=; b=OBQuU6ByxDXvGxAy
	GltdBWdhTiwl/LA/WAjgjNAM3pH2v13BzPywaOyufi+8puamuJMBwJbtJVCRjRO8
	SPoEa6CKNfYGKcJCzF/ezlRgrWZvbIX/5FKJRK+sBgotrFfJ9xoUcodl3R72g3vP
	HRnb+o3/lRsOox8aPXXoFtWb6jUYQvB8JTF99Be5kF27/dpieso5AzsFgwjnVZmH
	e/bW3YgkPtvYACgnVJTADFo/AfkkHZ9XcQQIbpAFQulf/uRaxeS67qkQKYpIxYnx
	C4oczWO4Rfp+AiWl7OwyX428+pvU3E294GnYxIeEAaDCk+6JskC/1OJ6qnUMlN/M
	gpblSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx9cm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:08:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494527488so120528185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250089; x=1788854889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duCBHsBCta3oYMOh90c4POqqhq50/eyJ3BOcaXl7OIg=;
        b=aS0khBa9rL3bRgvSlqekNwb0i+NfeGC/QSftjJx2LpgKKpxd8bc49Dmfh2lxqkBngV
         /dWH0aewomi0dVthSvSt93WvZ1dkdNM9op3kCjbdiYRHdftRcmY3w6ZKxvU6s49iUfQE
         8lfV5pyXvZETN6UnSdmzIn4nVwRY/0qMu0hvM2XHPoPj6afdyneO7dvxedtloK2ehIFo
         9poR2qTSc6A+G6ZMX7A1ISXO2jQgHTff+M2kokrNS7Ic6TYvZVc4Fcd+Dwrut+tadvGo
         GGiqkqdfvFH3NawKnK3KxqR4yckPvJPnt/atPREQHqJhHOiXmwXhdlAcbBy8bCk+8DF/
         pPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250089; x=1788854889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duCBHsBCta3oYMOh90c4POqqhq50/eyJ3BOcaXl7OIg=;
        b=JhDtIE1h6MWoj6N/pO+8ef6IHfGSKV+uMHvWsJGZGzTVg3zL7QE+xFEHCgtb6NiP8o
         n0E4U8MNQo4Aw8XO+z8eurtJH2LEJuMBeqFdkm+iK8OJhQ4zxDCrgrz0fauQLnBXUUk2
         c3nuZ6ZBu1O3NvQloJzb8aLpqJYE7Et1WnmX3N5rhMPSOIShourkUlYRvTEw0XEQLfHA
         K8l6+I03KM7k6whzYgAI+M7K8O1cH+RGHqy9TsfnQlEsqpuQT8ryuoqCXFlt50n1YERh
         WP/s3hbOXTSAaVPoEFZI6Ctl2+zeoRg2StOGv+Is6CgBa6y6yiuxEmhjIG2iey6tgR5R
         ncwg==
X-Gm-Message-State: AFuF++kVRIqROvVqE4YhObeop3RVqP991VCnIT0pCju/a/9JR3L2XDjR
	aO08lqZBrtCjl9ERObkhL77nrqsXZtLGks9c0xcCY1i5fCBVzeotSELqghpHp2Xp1FWIMRjdljl
	8e527BMGH0xSDsJcusRZbznDSzcMMF9rTio2XQ7KoW/uI0zFTiz0dGrf2dseDeXXfdnQM
X-Gm-Gg: AR+sD12dgdxWecAVIzm5DuJeK+9aNCZnsukWN+kjjwT8Ap3V56wYvSlm8FVzAUcC18a
	DMmxvT34720wrU9uTnKf/URUWJv7ruFIHGy2/1fd85yn1pxWXJqNkEeydifrSdT/5hKi2NR66tH
	BONw4+2djSCM3OgvmjlolzVkjEoW3sXYLiJ5ZZchv7ujiTTJQeuQ8GGGAEglrDcVOGPRErY6qAY
	WTQPokYnNiy1ZJK74GXa6aOqx7G1mMjzyYlYzzfkHMBt03CHXfEDJm5aaiU5DrX5ZznjXDMn/d6
	3vso8sI+1dSOmE1VqcdBdPug0wHfv0+2TnXTpWO09uB2JI9a6MslVgVxnAyCmUXzj34eWyVaZ1p
	2CZWMHdPy
X-Received: by 2002:a05:620a:29c6:b0:92e:7383:4a93 with SMTP id af79cd13be357-9391395ad22mr3407196485a.35.1788250088980;
        Tue, 01 Sep 2026 01:08:08 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:92e:7383:4a93 with SMTP id af79cd13be357-9391395ad22mr3407158185a.35.1788250083637;
        Tue, 01 Sep 2026 01:08:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:09 +0300
Subject: [PATCH v2 12/16] arm64: dts: qcom: x1-dell-thena: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-12-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sBae8R0vKEkozIUJX0qR+welSBPJeruryo4FOGtusrs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe2YyCfIsB3CCeMI9eWJndylkpFdq1LAvKG3
 +NzR45UhOWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHtgAKCRAbX0TJAJUV
 Vsx0EACaLuUIvGBBfPwkWTF32560exXX6swJSAr9zet2H1xusL+nPMZki3etHBe180T5JyJiLRS
 qkvDyA8EUuOptr/9PrOui0yTaqMB/oANSZDjDYniuM4kmaEbPgESqi1nZvSbmX7/MpXjb+5yiyE
 gRzJten1Pry6sifIutdlYOKj18yDwB0af/5LpDJsUPWZPPgKi3yGd2QMJ/aKKife7KnwfqvDeXF
 TMNfk+pBAP+kH53f8GdN0NiN7N2EckUxlQ7LQipuIPovVqiMOZgJMjwQqjqtbYezbzbs7LJ7xm2
 i5g7lHCuTbNNgtTS/fgcJmEuc3nY4SgUiLQRRhBVEN27ALR63nP+7/xkj3ehFIIpGcbFB1pb1ML
 bo281v3aDG5InERSeP+0xWSokpjnfjlk7KqmiCBJ+T7TdUagwj44MjdnRJPbVUkZQSXNVzTzNuZ
 6Nq7CX2sETXBkWKUqFSryJnazHGN1SliySUUacof+cmaBcj9gsm5AJykZtjlQQppMXrG5F8n9+A
 h3f+pTEfaA7eWmaTM7/9fhFZ/nTtBaYfh/RNMSJrVWysZGJGJjlR9d7yTZ7ePKh3ipOFe/O9DTh
 SdOcHIO2mH6tGuDcWvtuFEUZw4t233JV0iWUfLxtHcI4qx+CDo91s8ygmYHXeJG87ivGBL8qVXk
 leAEHfslB4H9iww==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: OxibZ79yi354pT0t_RyGVK7Rm8rBcXu3
X-Proofpoint-ORIG-GUID: OxibZ79yi354pT0t_RyGVK7Rm8rBcXu3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX1cD4kM5aFK9U
 gReK4uTonB1iPRW2plGlBuJzrR0PH5tFTrn1Ai8V8P8k0lz5hv6YcscJWjjPC+S5UXlFUiVWAA1
 kSxFulkGQ43K40R7/8/TO/Ko2He8eAY=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a9687ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX7aFmVdRl7h8t
 Zbg4Ewqi6R/rBuuX9lTgWLJ0EXfPXO6bP6nyP8h/8kC0VQ09ubrCrcwCox36MKqYmObCxOMQr4p
 FBto4Hl4hVHoEQ0lI9Eai6JJoHGtTHimpi5iGljTRpyOokilmZTty15RL9vbiX6eYNjMi24kgBb
 sMKC/6WnPI6IjupxBWNuRrHGaksljEtunGTlXJ7TAUKcxAifw1Hs9FtCsVoSdR4mbT7HMgpNmQe
 8iM1GECnIti6oX8Y2mUVzpaO1Dnd0icBjoYBZxH8a6xmPh+C9FqPdy4COtR6UattAwQEdWGuuyD
 YehpPY+rw7R5t7OPiC2W8gOvh200ss6+CuSRElyr4YWUx/uhGp/7E2fKf46DIT/hYSEAmwI7Ef3
 16xHIMH2XHTVNWV8wUbehM7d4C6wDms1FBX8Eb0FlOsO0NuLJf9qvzTbccV+9Rq4mPTM9AE8Eif
 5ubM6zZF+BXlqe5OuIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 4cda708455d8..b367eef085ae 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1303,6 +1303,7 @@ right_tweeter: speaker@0,1 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
+			       <65 1>,  /* EC reset */
 			       <76 4>,  /* SPI19 (TZ Protected) */
 			       <80 2>,  /* I2C20 (Battery SMBus) */
 			       <238 1>; /* UFS Reset */

-- 
2.54.0


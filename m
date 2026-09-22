Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C84F85B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063512; cv=none; b=l4xqV42zHrcyfTPew9Jyz/hW7xXL7K/vqtAqLXFr+C9Lsw6xtmOVIS5jsPFBJq/gi1oybyIc5w/8VO1l0Xh0obnOn8L1Rq8dt+HUTM5QBa9Wt0pnI4KThr1hj44lI22iWFBVLgLrzKEdDqMXZccjh8iGoK20lFC4U4yqxFSvwHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063512; c=relaxed/simple;
	bh=EQgqstv9o5vUPvoyrR7USbB+8WZL00cqFkFyvb3/MfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MP2P5kv9/xBmTFN2FVGE9e88ohxZ/bJ64g0BJW8IVGQR/HBhdQwKDlJhx26yP5tzIkkXng1uza5UVhAiVl4ai4cziimbgWfralOInDBYZPwK+3s5oHoeUAz4VSOEm6j0iqleYJWvXorcX2Y7u5n1hWOfyluI3w1pKC4jEvZeGks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMZPqB8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlDI7LV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMZPqB8X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlDI7LV0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M79mnk3677615
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+CIh4tIaFqUrLEgvjrXOO+YyulO4/MZfSeRcQ+J120g=; b=bMZPqB8XLcv09FSi
	kHF2qghA+rqaYbqRamvdRWkzR5fQO0I4QcrN1MvO4QTSv7wwybilgiInLRUaNSSx
	dIT4/z3gpM/uLm44Pra0gInjcWJtqPLtLjnUALnk//Zq+CibB+f5OO/ezkAR2a9w
	jn4zKO6jZJrvf8Zsdb86qfTfkWIOd3kbRC3jT6uB9ZYgAePZATUpb1Tbbvu914Dg
	hfWly3oZK/C2pyTI1hiACmIFAVi2J+HK8WNAACZnezeX8M5LngS/xhQF8e9wcgjO
	LalZS+JjWBdMAFozFC7B8viQcnYCSctviFFHyYmCzK9d+LOjXrO0zbBO0SDY4fNl
	FxOHmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vk3p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso749476685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063496; x=1790668296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CIh4tIaFqUrLEgvjrXOO+YyulO4/MZfSeRcQ+J120g=;
        b=JlDI7LV0k7QvhLhdI5KOl3J+R1Rbx0o2bGPk5B2NDgfgFis/QgYJ4pQ5q0Rzl8KGPe
         Z9pJ6+7JrYXgqynMh7QxAD+Uacfxqz3QTyqEVxq5xmSkn3gN5HIp8VrqNHXUfE4aP/R5
         yez9WaPmf5+QF7su/skYcwvT44Xn7w1VRDvW32mX4DgKMflU0T/PV6xDG5VDLsDZi1YU
         3+btVme3gbHutFsRXCHZhCbVrqnZ9a/xFDaYyaUkQUueNcIhebo0l9SRzayWqjYvUNoT
         5NzP4qsonlDmKQKTCReYYXWlQJHmhQ8Zz/SMDBgO/+MMHrllMwes1t3bkLt+YM+HzmEw
         ZAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063496; x=1790668296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CIh4tIaFqUrLEgvjrXOO+YyulO4/MZfSeRcQ+J120g=;
        b=eSVolsazIdXEz9ojEbWSkp3C3mrq3UUz052B5ISjLM+EvXHixxNuFROM2WGh//36OD
         7lBFYSqrg4V9bS0eRViU4FLLmnMRmhCNDlrkPMmAs53ShwArBBuH8F7Yhk3NuaVTVYqA
         Xmlf5wjeTRJcVMNaxRak2xfgDa2QdEUbzoVOG5CHZ1C7/A3eBymw/u/WndvJabsG2WAL
         P3KGLn/J8lm7YFfeLQsMZUZ3f0lg062FKypOFhxmwCJJFjFEOM72J9Qy2khd5Ml1g3Nf
         GINoacXDiFnMZS3P691CzfdtpXHrjQu7XxDPgwVYwKYJQFg59J6pxrOufmOMfvhNv4fE
         Wshw==
X-Gm-Message-State: AFuF++nPawpszH9gkG0dwshGgzF0Y43444QyfSFv+Ib2a5rDungkCO03
	1v3z5ZIuCB82XWv/NAwuTrptmN2ViCQtcxV9JvCSslGGpx54CVbPUNgz2f9AP8RT2rcrQ3JbvBL
	RFWWoneEfGp+X4wfC79qSBn9gy2a5n4UqmNo28KJiLF21MiFYqnUVV0XN+pu0PMnNXybh
X-Gm-Gg: AYBFou1h4KUduPR+PMfPnrYGUdOygyEZIYf6bglGrveIxxBRPiz/vsGT3eCT4nLI/NZ
	sQgtPxn0xotuWMEbjplGNzLfVolHV1OIXP2fstMRcOwsEd316rzQ1QbquxPfgCUSkqOq5E7LOhP
	eH07QPX+zhI4eKIR/RVpZy/t/jHiNztENhgVJDmv5NHl6TdUdP/ro89krtKhZz2BSU24QegjzHF
	XmpclAIE3jfkt1+hqZ/tfBXm5gNH7XSzD22gpxGJ7QwC6ke2+BrF+13pJTWftQNNbz7ztW8p7M/
	DVUfpcWExnGzagqg8izaUM5zPX4pkAlC5BoXs3lLSGL44AkU1Hk+oVYm9KOxWS1ltzTBSCOhp/3
	EM3PBfcx9
X-Received: by 2002:a05:620a:2949:b0:93b:d7a0:d9dd with SMTP id af79cd13be357-93c19a67345mr236499685a.55.1790063496271;
        Tue, 22 Sep 2026 00:51:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2949:b0:93b:d7a0:d9dd with SMTP id af79cd13be357-93c19a67345mr236495285a.55.1790063495756;
        Tue, 22 Sep 2026 00:51:35 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:12 +0300
Subject: [PATCH v3 03/13] arm64: dts: qcom: x1e78100-t14s: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-3-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EQgqstv9o5vUPvoyrR7USbB+8WZL00cqFkFyvb3/MfA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN0DO2HECJJrAYgNrLEuaFtDNg83a2Q8UDwO
 6bvfn1xu5qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzdAAKCRAbX0TJAJUV
 VkpDEACB3pGE5ImWDk6cbxKS8+QqqyBQTsxJLavY1womKY6fhp7+PX6D+s/0PF1zX2F53B+3KPD
 yw/9EpA1imRupW+o0qSV1w+bdSitNOnqTWtmXD3WfhHE501uS+0W+lO4S4tK0Vi7fLWKKQdVefO
 jq3VeVt78QsMLvr9ZbnP4jj8YwerXADV2LtRQ/dtYMYah0rmcXD2tETUt0a8mTfyvAlTW16cRRV
 WJjowQpvbg0rbdmr4z+w7kXjILeObgExSYHjGPx3C3CQfErRrYOBHaqo6VQkBepG73MANsP8cCu
 Qb5aZ9NcT+z3gJHwiReUnTNJWb9rmSLNoDe+HHpDfUmDA8qVuLKssKjMn0GH9LqXYH8XvH/HNwH
 +LNCklMmGwrjDznzUz0doXIqTm7yAjE7zPwh6BasmtuKyfKqquY0i/TayfQc+CEDjnu0sDIXz1k
 L9u/6md+iqT60btemaFp2G+lQeX8WYY3SbVxSlZsyvVKBz4QuDQp/tJb3jpTSclc7KDuhMK1Kr6
 EmX5HXmqqoTSR8rqMlHqw4Sgx3uJrdqdpArcdf/7VLK+/HQb42G3aZzsBAm9FR6lNuhDSyrmxCO
 Zwu1oHfkF5FFVsH+H1Ufi4UEDZq9vup0wxznE60nHu3DrnUYGRgsfyOIb4/HoJ79cDs+CMt5Vge
 b3KdoxHQtd86Ezg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX68PEiVlW03s/
 70HKTXl0S3BPk/zHIQREqcSTvsfv707H5tiiCcaD4w3ClrvZtpu0lq6oe9rKhJhd632D6wQHHe9
 3BXsZc21Z+pnla6ALwAZ27pp5m9Hpck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX4J/PtxRyi40/
 8phgF3uP8ka0H8Nal6O6YPHpV0y6IGXEsgzrzoeCZdTIo2pgUv7EaUvHz3Bn0gQWbmzprBQdune
 oHBm8OhBv/nhQUHzssA6ZmsOdy59plMp2/BFv/Px2oagIGt8okNWNMeOP1pe2iJWUZdNp47Aa0N
 QyD4OEVebF1ezVS0eGJoBPb683b78MwiLcUKNJIwJw3utcS/ItCCixhYjVSPzztRGhvBe2/La4Z
 tY/n4g8gTGXR8teNfvEKIIuV02m1X3sEjr1IZ44TCCfHopcFbIBOhwQsfqvlDlbqQpRxQq4nflf
 tlTzjlC2OVHHqVvLAet+IEp+AJWlPn8/VfrFR2eMKBcYy46bPSy2wg0sTXMpxSJccKBA0nckXN2
 zFdsH8+D6i4lSjtmh1uDh9XSTPBDGQSa6fLi9MgnwwTluzAwQwiKrClQA9wBUFqKgtPqSPe/3lS
 VT8YsbY9ffEIzzCawpQ==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab23389 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zlxQZoZeHUdasbquK88QSFCcXEMTOrhv
X-Proofpoint-GUID: zlxQZoZeHUdasbquK88QSFCcXEMTOrhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..93c7e3a02041 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1406,6 +1406,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0


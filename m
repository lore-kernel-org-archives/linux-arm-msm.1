Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D643F1ADC
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170702; cv=none; b=sCTdCmKmCPMqVruAClho4s47fXXm3uRHqkOrkjRmEtFxihlaq5gtCoJgii5gfqrFc7AVY58yML7qwodjgkC9t9RJz9ogrev/pt+8ZphHhwdIerUmvbSkROHkizbjPkWMcP/fs0ZwWD2L1PU+Knkd8VGzbH+UK6NUv4jHkSHqAHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170702; c=relaxed/simple;
	bh=DUynSlMvK565KF3NYq+i2CbR8nZppjP0zXKGA6lFkO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogBm9JKIVDIxFX9qyEn9tE65z+QWSDCMRFRkjOsSWI36ayRqHqahcPg29iXtV5WnDSLG/G73+AumSjPhRaoyKL0CNu9d8nnX0hvhOzaWX53q6ojNaBkaINXnGu90ebQoqXX3gdCAW5h9rzjg1erVQzcs7xFB7cgmYeAuG8+yA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhI6qapO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYYWxZ5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhI6qapO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYYWxZ5l"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xa9q2924435
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ygSaO1Hl5UlO80RWsyJe27ckOHWTE8/lsCJ33I7BK4=; b=mhI6qapO+bt7RKHn
	s9/bA+j4iKPsP0AAX3e64M2iK3zm8HSIs02NDb8GvoRHs0Id3H3ViJybXnDXkioC
	B81if/m+spKw/Clep/+UaGvBA7olDGRFJqf6VZ8+Ql+0BMnqoTPzdafRTxy/0j3j
	c3GeSj7qv6dPeyuhMrofTJdt4Z45ZHG4KqIolC0X50uc3xpnFeh6xJzKvz3DK2n+
	uPMqiNzSUoOqmVqbv3CoRqO1ndHTrGv/APaqV0xD1GEtY2cg6Hy+6EwnuA0o4CzU
	KjdaP7FxakuFLV+VJnzScLo71Vcb8LuJeOvpZvzUbcsDAK+AsqOVAfJ4O8wFbljw
	nHzT2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wa4ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:04:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53013dc2330so19312901cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170699; x=1788775499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ygSaO1Hl5UlO80RWsyJe27ckOHWTE8/lsCJ33I7BK4=;
        b=cYYWxZ5l7Sj9YfMstfYPUml6hWi5wU/5qwJNes1c3qFOoHF8hZWMgDXQXGPUO6x7vZ
         6pUQl6l4Fl/6NSP6tlCXzyW2dJMwd9NpF3lp+hGVaIQWli6B1Jasg7FDJLAx7Kv0yVPk
         EzGhRL5NYShhqkH5zqX+nP/e3kVCnGDYzchsBjQbNzcvJxp9GVWcKVxfVuZCECspWkh4
         D1rWpiF5kLc/JkMW/P8zCNWEmhDFa/prjdOatLpSeEwnMZYt0iTfLGodZbmiWbtLq38s
         RIfZ8TjXXrH0bwYmikvNXEcHude3Uu0QHXiOnqQi13JByezoRABtUUz8LD93PNB+yEkP
         MISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170699; x=1788775499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ygSaO1Hl5UlO80RWsyJe27ckOHWTE8/lsCJ33I7BK4=;
        b=Ec5nYTVJZpcBMBOw7nbgqwRbpKt0se6ZbldNo7F9YNCbnG+EdqNpInuUKMD0Splg5e
         mo/vN4+z/NXBBAXomCv30U+qv6o3bIuOdf31btY5Bx22FBJy5uMjjk9bPsuMwmCcXK1c
         wYizSY00TlzRl6By93v7HObfSBK52Z+7sl8CGvw/u05kEkDNWSRkUatstiQqs0nyZ0Eh
         QU0eq7rxX31pvbk3AXRVOzdsacQtJTSwSV4K2dtDG8L2DAGixzj8YJKFF+dITQwjfbcl
         xhE/skbhA9+tPpf8e5Y9Vqn6aMUTMcbqAuB2eXik6BqtoeuKb0OnSvqfxlOp+iwK7XSP
         P9xQ==
X-Gm-Message-State: AFuF++nPENvOZgdaqJO9j3FHnCtXvuX/1BJpGl6T4cCZ8x9u8CD9kqRq
	IffZF/et4+ybW4odQrJDGJ6r/6VEOQM4uWUNR5pHnGQGcys/N6CxeBvvIzTd9XSBBAjdNKkIysU
	YzrwKE7vK4Ngq7j3vcmdafRjFZwsorNiyKF0wRuUbCCJCQb4lYCtbnQqxjyoeTQ+z189O
X-Gm-Gg: AR+sD13hZtjCw4f7PFXdXIhSIbtlb+DAF7/0OG2PmmV1DuRNpBHSTrhzIKuvkS/Iik3
	vPzkUz7ZzjmfaGfBHY8fyqa4/Xz0hRMWLDUM4uOIBiaYhC4lrqThwIlQD+9vL+glWVZNFOS2MDg
	KTVNtj2bkARy8hNqH8lBvltZBkZg7PRRtxmkiOxPZ/NBZ5ctobLgFk5FxAiw2kXopn+ndmcHkC7
	i086/Cd9Orb9KDpw6ts/HQXZHPZnCOJeFaiwB7dLmVamNQ74FNrHC6BuH4+DJ3ue044I25KWCjW
	KWn7DGPfOAx5b7W9QmGvwVf9a+8IvaRxlyWYh80jTFR4YUX/eIEPuPjqJLwZL+cBPhHsndGeuSW
	akVi/QA==
X-Received: by 2002:a05:622a:c7:b0:52d:882e:4986 with SMTP id d75a77b69052e-52fb938c57amr269607941cf.4.1788170699048;
        Mon, 31 Aug 2026 03:04:59 -0700 (PDT)
X-Received: by 2002:a05:622a:c7:b0:52d:882e:4986 with SMTP id d75a77b69052e-52fb938c57amr269607211cf.4.1788170698511;
        Mon, 31 Aug 2026 03:04:58 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:04:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:44 +0300
Subject: [PATCH 4/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-4-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=968;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUynSlMvK565KF3NYq+i2CbR8nZppjP0zXKGA6lFkO8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVADnPOkee+8z55FQq8/DMexXk2yrJ8adT+dY
 69UDMao96SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQAwAKCRAbX0TJAJUV
 Vn/nEACYSoGtx4bggn16bnQkfNrMTxUJl7fZ4jLs89ho0NWygG0b2AMMC2DULAH3s6btfgLdGut
 ABkeBzGAWhLB81gx3gwzDbVuAVwafywRES6s4Bws6clawSKHGWpWAd7B/8XKcF6iLQcYEM4XdTU
 5qSVDlVLTOv7rcaADuFQ508C+qYe2so+i3ztAmmSXwR7nrUBhLyhHV/gAPIRxSf/UQTkKCYSSxB
 ol7l3QUIvrCwNJ7JI2HnF6ljHoiq5CCv8KWjYCsk9dpdkGW8tEP4oGK8Cg+azgX3HHL01hhkokN
 vLIBREDGXFVLLmpOsBS5LeMOfqOXzQEUf3SgZHDCtwskwainqX7y+d10xjoEc0aKKKLevO6y190
 X7uOzsHFIeEvFYiDhQ30WEclqVGldQfwcy4Bmjr3YR+XRv1+iccXMZbqOsB0RqZ7gCK9VZKhAPL
 EmUzyO7vtDv43hReUoBSeR2krunurIDj7B9qkHS0WGXQ8LzISYQncp1eglLC2HEuRjCBJBFhZAh
 XET5AUq8T/Ku0hvsfFCWBvu3kUpMqB125aeKKPha7kXmyXBCI3F+7+e44DHpIuZ4qXJT/4c3JaY
 EEDY5WAL6oUxHUWcImxq4cv2NVVaM7Jbequ7+uY0OxqhnRqAP6zqpvTOwjan3MckmLZeiL6zF6a
 fhJx/zXDg+fKhkw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9551cb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=emOS9by0Z_JHFSHHS1EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX5iq5Sjof9a8j
 X0D1WL0N/sXn5HdpuINkvKnyCwqmwIld8pt57+1MHDNyvL8Mc5BQGxcDh+vzez7OGnkp+HB4UE0
 iufrDVV5QPSK8r/YPIMfOVb1Hgc30+E=
X-Proofpoint-ORIG-GUID: UesanF5u7bWJXDMYMi3AzFYiG-1tHC07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX4hcQQY3wWsB4
 HuQLToWuidRQXy+9rOR5UDtqMKKwNhpwWH2+GbZCl816VDBFYaAiiFUFJjLE37j2WckQg4EFP4U
 DeC8jhU/H4STJYReCDjk0HS89kSCqlbphd+Xoru0ebEBj6D0oG9cZWiRvnWwoXfrFOQ2rfjGJ8k
 /NcjKj/2j7fhwDxdH7mTQHeGf/nbw0BLQgfsR4WAKc3OOJygUaELv80VD6aZMfPeqdbNUImmson
 DVxABUjXY5afPD4AO7ezaeDjw0tQjrcirAlPiKAom+SbsS9aI1PS1QxNlrKgI6ni++mgolC2QfL
 Zz2LKag1VxNUY6Lo5vOqhlwQeuqNJJYzqi7OUXEW3+YJMbFK+zG69pmgJ6z2pP6VKN1pB5CoDJo
 jk1Iv33BHuKa/b0b46xaFARb1ZyAx+EpVHIivxSL4BmyF0wHL23tLZC0VaGZgmMS+VxT/rMXm3Q
 XEcsH5zDocqWxN/o0QQ==
X-Proofpoint-GUID: UesanF5u7bWJXDMYMi3AzFYiG-1tHC07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 2be5a37c00cc..b795b65d604e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1072,6 +1072,7 @@ &smb2360_1_eusb2_repeater {
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	cam_indicator_en: cam-indicator-en-state {

-- 
2.54.0


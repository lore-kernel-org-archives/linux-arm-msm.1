Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F4E522684
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063517; cv=none; b=TjeNG9DIhGynCzz0r+7eqMDWinXo/l2ZzbCJk/rvSFZr1rLtUrDGBivTZ/8AmmauqbLcCpUieXrvR9ZAZclV9beHxHWx5/AWuJVV+FA9316vsRXkBjBygHDqhbDV0QoFnGv4z6ae3RJs0WATe8y1uUtcZLuPhcx+8IC9DU9jd/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063517; c=relaxed/simple;
	bh=OU5t0isFhdEjZbDP62BfBhb4x+q5Dv6Vy4reHdXUe2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfL5haXn96N5htElR/la//eZOSaNAQvQmZtj81uXhr8MsnPABE2cY6sRARLXuWia0ue0TYnAoEVZqbLhKW4VKl+rNXV9H5v7mpEd9DOsfqsleVUsg9Q3+yxkP85Yqg8Sm/EIQ+iF3vvQxA0bxQ8sLKtqPuJtRgRM4rkE+rTW0O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kybpJ4iw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dM723J06; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kybpJ4iw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dM723J06"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M79mnl3677615
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUBRV3U7ejx0DxeLdoe1m1E5NXK3ux+Zx4E9n6Y7+bs=; b=kybpJ4iw7IcxUHrG
	HjZGAZtWaNj9XGUyvhnRlp2fScOmYV1pcGSYTEa3r4p2DrUEsRzRxly7Td5AsYAg
	EF5WHRpbyhxGxTfDWh3xjOeVvfwROngtOwGN7mGPsinYRPyvvNBD1MEfZ9mzzK3w
	R6E2s69m4K0k/TorbtfORqAIrgVZXBSoV89HPvcQM5XCJDCBmNnFbStdHN6Bpkyc
	U7XVh3QaCiGxiCvL06Gl/pZLr1xWQIg3Ziic0w8dCpIFuqB1HUbgEM9QIyapvGrM
	wCfeZ3W8m9/flwbGNGSrAf5iw9eeKxURKaDSMV4xBXHghj3kzQGNvi7dYVbB8zyJ
	PV8FJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vk3pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so602405685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063503; x=1790668303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUBRV3U7ejx0DxeLdoe1m1E5NXK3ux+Zx4E9n6Y7+bs=;
        b=dM723J06e8EOhZQ0FLKrK5VxF53VTuhSkuJf4U1p6juIdCa/PpJg1mgqnzKm9ssvDV
         ovTg/7ecRNIiCK4QuqAprgCDhHyYMLhZR0s9EZ0q8/6FlR+F53TcPNAjbkU6lUgkCzOy
         0k/Cu0t3fUpfOsHrK1AJBbmTQQnwEhePERHvfHwD1c466Msq/MD55BdHNW0UCDIJC8tL
         yfMp2ChCG0/1byVaPCVqw1e1YbWK5sUJ11F1AlAIdk7gsdueQskCJeCDSK6DFgXlQaVd
         TbrD5Eq9vWLEN1vYju0M2jFoawWVq8TS6fG4Ya7ff9P6mqkD3opI22AR+hboRjJJafBU
         z6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063503; x=1790668303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUBRV3U7ejx0DxeLdoe1m1E5NXK3ux+Zx4E9n6Y7+bs=;
        b=p6U0sPB0syjRKIAFrNhrnz5qdyJZbIubmG8g6uLqGUeLZupnInK5DziGCPPARWTnwq
         DoTxZQeJAFeTPgFbUa+N6sfBNT60pNyzqV+/5wAmsoMd/AfmqZzwlxxTdEy2sBce9Cb9
         gkfAW6OkNua6lFGxjkX0g09YgoZfjkp8mVS+ZGayBWnHvDWto0QrOaV+ztOGK+R8GPHx
         2j+OH6MP3YdhnMVt6o0f3xZrzp6UEQjJ2qg/SX4XRp1AjYV2opDEMicgEyX0PUs1amO0
         PBLyzcTNozf3a715Je/lVjasI1N5EknV7oX6JMAefIvSOicmPwwntlX2eb5A+Z103qYh
         Oefw==
X-Gm-Message-State: AFuF++ly5MaQSLRY9SEogk+FoRoDoY2toc0JYeFlMCMjzh6T71QjXOd9
	WdNnPgwmlA5Qjwu738eHZEAsFtKfgipkiyJ5fe6bjXy+Epg/L9+m0n5fTvn4qHZgb+COAMB+SCq
	CdFWL9gNsZXJOd1b4qGkTshCZvzuJdBMzmUMxn1fsuPd6Q/UG3p69k0lsCeR7foBS1tIx
X-Gm-Gg: AYBFou1mPo7BsSHyWCHybBkhf7bNGKXnkGzMkSAKH97TdqhQeVvmFHNVt4LRWd2ITH2
	N9ZTokzXBbxN7a8LZ7EdeGLk6Ahy468LaZxCb51UA5+Kn8vjmHqeRy+dToi/VBiykkxmtXeSvdk
	gJjuP6yg7QCNGHaxpGLzhJ11h33TjopSjuM31oqE9AQucSXCtjpLQUP0vHHH4ku9guppTJ+xaYM
	DXuJOoXkzy5L0hKhZe+Psf0jRPEohvENsuPR5AZDY/9qDELD2iBZYe3JdRbxqITG2S41MvdGFeU
	TRbUxz6WGRBI/jwHhGc2In3OF4HGNSO4l+N9UgRIpUeK3HcMI+hBdv8NHKYKhM9uHMqUbGJ3gTD
	FmTShBMx4
X-Received: by 2002:a05:620a:6f0a:b0:93b:ebd8:9147 with SMTP id af79cd13be357-93c15d9c330mr413958385a.18.1790063502431;
        Tue, 22 Sep 2026 00:51:42 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0a:b0:93b:ebd8:9147 with SMTP id af79cd13be357-93c15d9c330mr413954385a.18.1790063501941;
        Tue, 22 Sep 2026 00:51:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:15 +0300
Subject: [PATCH v3 06/13] arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-6-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OU5t0isFhdEjZbDP62BfBhb4x+q5Dv6Vy4reHdXUe2A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN3hvhZkhelsUN8Sbek9g/PtK+0J88MCCeiL
 C2pkLgunyWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzdwAKCRAbX0TJAJUV
 VhGkD/4gONfw4EzaCRtg2cwXYtw0mqPB0wsaEYnk5Dkkntxs6j0CYhj+QECdrV4sagxD6GcSR9f
 Qq9jsCiO3KaIva5DT70YNVbh9I5SWyYsTpL9kSLux6MK5xnJoO/fW4Z7/ghZ/ZVzd14h1hP4GiB
 Glp/kU6tRNI2Z0jRdGttN3DsouTumndgXKMw661AhvT4Rh50Zrc/+roRNHS5h9ZEsKsb71dQF2v
 D6tY89yYHD5aFDlfbRy3mYWzv15lx0SO68ky4Z6USf4tua5bSnweosgrU4QJdmnk4bCuGZcrllY
 jWSXDo0xNcjqY716r16Wgx9sp3cYuvqUfsJaI9YTL1ZkLlLS+ZLVYQpni4wgV06W9dB2adINNW+
 tjUD41g9E1idYgcewgcTuWsSW776zhH7UC8C2svJ9MCwND2KsDgHJZ5anWMH3b3tmCclLaxFI/h
 FDbqx+jQM1aI7HZ0W23m/rRQOhoUX4qcv8lSbuqdvJnpSshz4klgNi3CHKGVE+HjxkMgyM5hdCk
 Wg4q3oWBivp8bUtYo7w6mPYIMT0hVkEci+KA6HFFQUkBQORuBwK2xG7IhjeflOXXMUTkwmIgTdd
 T0lvmv/GBOFj5VEyaFUSQQC3OoYlfXOHyHGAp9iEJ/bdJ2qmyf0OkipnAyQfli2yKWp4jNyJ8K5
 wqYESuKdjmi6h5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX6+RwyNKGQEjp
 4LmZ+lRoCUXOxhPt6LNfWpy5RPnmLuyqqUrBGUZ9BlxwjP+5P9qJrKgD85HL7EZlDFhdSaiSYW4
 BPVzj0an/WGdesU4V0E/QZyT8HnOYcM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX8AZ1ppGHkZHz
 x+cBWtrZpzxP7BWYvGyGESknhuaRnlQiFyyfgOWmNbjFShV1zgzyzGWqV4b1RkQXDo7WI1lFqRP
 0FuR+PqSmsgoBP3kDqukMFxIiFk5xDyUGQXC3UonilbHhxlQDasbBAjPjbitHHB9espE8Jh0LpI
 ogFjjRjSHXG2Iw4PbpzLsOQhKPyS9n146T1lowv763vlNzhNsdMJzB8/cNskGgT6Y+eYIehG7D3
 wGtc+UD5MUTPg54eZfVERVO7b+cRl51F44bgeRgvNAHOaBJBMj9eb08NFIB9gW/KzB2ct+EgmOE
 ZHlLk3YbVD1z1NPtSsuXnzhSgQ4V/Lq1oyTZdhx0qkV7n/8UjhKjvF+0sEYq6wE5AC9CzkzylOq
 inoO3cyKIVXvWcunn4SfGlguQFdHRlfxbzwT/eJZRf04Y1pup252ROa/5s4K8I27X1C0noGPXQ2
 FptiOsAza44b5sv5g7Q==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab2338f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=W7BNYNnVXdRFd2eF4HIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VV1RMIzyhdwTyF1yZYAxC_tLXhkgpT6C
X-Proofpoint-GUID: VV1RMIzyhdwTyF1yZYAxC_tLXhkgpT6C
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

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 2692e48537aa..dfd589b17fd3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1371,6 +1371,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0


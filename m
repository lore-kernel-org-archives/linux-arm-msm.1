Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F84846C859
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250052; cv=none; b=fwD3mz5bY2H+0XZ9VpJohdNq/dM6NDsqTYBx3QjSntrxhB0phO4s1B2bRpFHQFC4PuwvbmxJOhyP9iQkziymeciy0Nz5l2Eu6GU+BAdiTBkGeyLbpWe1XNFCZJPsqDTxJrjZNC0bJq+1yUgdBUEaWSa590SDwJYt/fm+nNOWowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250052; c=relaxed/simple;
	bh=w13vuvI8AI1yXKCEKx6VNu/59a4NypepIsr3mLgY1GQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/n6jZKAdyMrUj3gM6anKzgeVEICEZUirEsbWLCi3DkTUNsHTmYzqSha2P0SYQ+EkOcpWoi5Q8EChYAWTVfkYj2QO07LR2zlwE++ntAdL2u1oVWmhYfuMXUhpSIhvQaoKynNiUdApcdF5+YxYm3+qFjEB9clxRqvHuaX3cKle0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgPYzeGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bh0c+tEj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgPYzeGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bh0c+tEj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68178stn2974290
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mk39vxOxIqYpN3qZ/D04CiRD2wogB5ytZRkx+4nMg9Y=; b=RgPYzeGs7adO4met
	TylSa5QIS/rzvwjc90oAJw4IbX5OveuiY738CiZst1mpzvOq7sYh5gnht9WEYR6z
	5V/4X8ZU2wTXBT9GltaPZhyFTCNnm7AAS0dZJmG88CdwpJqWh25gXnleYHVelsjj
	HB8sAzllFjG94Ni3InKVAfiBM4QwwT/38FbvU4rxSUYts4AR3vnU3w3EjzCIFyKW
	3MA/g31C8DAiyXQn4HCo4JNN5CiU/Xic/Lt2kZfP/U7WalQeO0gpesaS2zbIiNlx
	KV1AYTlPJLVj041Edd7NiYRR4P7AMojVb7bItq3peBgM7t9GEdtP4rb+4cL1n8dx
	uzXDRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu0bp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:07:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390ca1a9abso104695185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250050; x=1788854850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mk39vxOxIqYpN3qZ/D04CiRD2wogB5ytZRkx+4nMg9Y=;
        b=bh0c+tEjsvd0p0NTCcazYp2oUzHN0CiAq6nB/Xh3dnQps+p/ugZUZf2zE4DGAvRwUa
         udl0IpWAOvpJS0Kh7VLQofzuftLcIpbGF7Hhot2tGP0lRn3ZKB61eW2t7crpzI2wojy5
         hnmJXgINkKwPxqm727Enyo+w4W3DFIvuZMiWEPizf6sgwEt6KM04EbNfrciQ7KGQjrkj
         /bDnZqJLlY4QIWga4+3VGfzrsHZ4hqp+Np4PCC5f1kdj+EUxwA1Hh5v/7sdM4YBUBVxg
         +96ItMGQ/E/7kzqedP/Vg8k+HCR556XfRO/CU12Mk5D7NEV3PTgB9J2Vv+GC7lvl56hV
         Tnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250050; x=1788854850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mk39vxOxIqYpN3qZ/D04CiRD2wogB5ytZRkx+4nMg9Y=;
        b=i0SAo78Rfn5WAgo6KefKWaf8RTIDcsUJJ3jn5WkIstlOWqZC0T4sgU/K1zXC4lG9Gk
         jdpUvTdrHCfpHjwSIgPiFPHukqo7hlY+0kPAVortbZGiOeqyfsetFArSjPlL6gJvgrLh
         f3GNIzGF467eJgQk+BKWRyz70IXYqF3RLnsi3L3wChh1Ss0qsqu7EXwS0KC8O3ecbUud
         mOZIh5AQgzm4whUO5wlQ23HfmSKMMa20zMkoGqOh7eDaj5CmB39SA9cz22lW6RfAv/r/
         CfA+hYWOGinkoHGTzOvQ96vfRHiqfJb3WCLqj2gqWDi9agUDoTp4BQr9FlzwJfaGm2Rz
         U08A==
X-Gm-Message-State: AFuF++koISmTh+5rBu8EyKOZcbPfz+sLIkrKly6uWpOPRRTGHAoMxKbX
	wtfeNBB0za3V6x0Qq28aymAD1ohpcafLsvf4wrRV+3eZ7kQE2xQcsquZcfHqqEztl2hLjJ9KlUI
	/0hVSUkRusVQiKr2i6KUjT4SerzXlcGxQxp6p0UyHfZ9j/nznDhkIomaKDw6GjAbGis5w
X-Gm-Gg: AR+sD13/qErCw0U7506HDLRntBnItTjlgrKyWdT7stmj3RSocp6dKGY/Ea2cQFu07M6
	QLF1X3itT+q4u/eQCd9pLQXT/lnvtX+kJSufVKm5NLVuPO8aEBCs5AtQS3H0O+sc0QU5GMzdAyQ
	rNwaOkaPw+PHTUXMiLOVcqPEVKFb7LFqf1DqzSNVZ017kZ44P5EQSs6HKc59FfZyLzDxPg8wASD
	VYMuosyybZOkNWAd4ibifJI/N7BzgTK+g/QTfmN7K2VDpsrf7mgeZHD4ejHeV8pl7f/pNe5O7ns
	ZagIvfxTAIYJFYB+gBZlvDlAR6KN+uZjxC2XtpY0NJgcLbhtcUEsHyCXjvDBo01zMqFDG/1Nyss
	ctHcNe08v
X-Received: by 2002:a05:620a:7115:b0:939:1f46:3bb1 with SMTP id af79cd13be357-9391f463bbamr2588639485a.41.1788250049675;
        Tue, 01 Sep 2026 01:07:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7115:b0:939:1f46:3bb1 with SMTP id af79cd13be357-9391f463bbamr2588632285a.41.1788250048999;
        Tue, 01 Sep 2026 01:07:28 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:06:58 +0300
Subject: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=w13vuvI8AI1yXKCEKx6VNu/59a4NypepIsr3mLgY1GQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloer+Cl7jnYnyw0g69jNKqIZY/ZWHA72gpAs4
 YM2a9Umo2eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHqwAKCRAbX0TJAJUV
 Vj5dEACTG1O78AYAshBkyE7WJgYS68G/foQJyXUEOluDhB3J/0VHlv6Q0K7gHo65XNdvxy6PFp8
 D5gyJofNBKI4ileTmNyyWhY8GymKizM/eS7B8Kf4XY4yOdNehr2qnJnq60cC/Iz8uY2gcMjhx9+
 Dt1EtWOvA0LgcwUc1pvN51bWORND8PzjphpOLs+AwN/8//+UhA7UIO8UCD+bmu5X7c07L0jhK1T
 d5F06JSnwssRkaKouRRAmj11g1e/MH3JTtXNfCJXhiaXHVncapBkVpnlXXFgFEm6WbnPVCoDHRe
 3+EOBKTMZhVdbpO8SDWI5Uyg0mW6Xro5JT1mQChADnmg96VUC4pt+BP2tqhQ6xRgCekwzgleEVM
 aZHi3rScva2cWrjhd0Rmn5xzZVVNgO3pcq04Zr7sMsbLukM5Teo0lh71pKJyaZ6ryE6H95CuYdZ
 IMFxGXmouRlzdoOPL+G7FtcFTBCUQZ72S+DGs2e9PqqEM4ZfjnCWyitMhNXeXG4kMjkH5go0Yo5
 9+GW+JEXmA8gw+T8fXXhev/7quEiObtb8/CSSC3MSO6aeRih1O0CJIY1TW3f8NcgYsI5b75fD1M
 Ih+FZcuqLv4bOKyAKeWWuKsLZpiHHP7BJId/j44gw/QVH2kS1jtQeqQ7qFlO+mjJfwqlqjZXyEX
 zutixXMsmpKIOMQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX3Ps4AfQtLzDE
 zqDSmaFG9nWfiI9DZ0VoBH1sZqFQJnveI5RYE/rx7Lpw2PehrYbF/QMcwu0C5ervd+HRAdWgaZv
 BiMiO/J6mNMzzExmQPznOwnnj9YMqcDitCSZPN756eKXLZ/RLd9Q9DKK0SXdUUAOUNrs/m/CUV/
 5cyMer/fqKBciFfRQjxBjAC+Fj+LcG8FDq5NRTFzd3H3TsOK5tFVWidw4wCWHQSKVXdkyjCVw2p
 Xi1ZfH98QNIkFZ0UBBSbE5qw1NDRJmFJbXojr4pTv10zSidedOV/8GuFp/zFVyO1jCfgmaNOpig
 Fp52u5iU3DaJxFDh9oXLSurA5xFaGW1jGqmTf5mguNUacpAIdLV4z/JPoS3h80SzExySynWmpn7
 mrKDMWQWesnu+8x2D/TtUcSiH+Tze8IScnJ9NAOT0iBhgL4cwB8D75bzDHlffWq1+k2xcgEdl+6
 CigqMjE4yjHVfdz9HOw==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a9687c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Hz9TZkmbOGt6frmL8bMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX7yZPrh+R0eCq
 mHKwPWbGozoZIjQKDAXUxMrewYXPFpuV3Ps6av3hMKcBxik96rlmqJeD7K4ns1CyQ5Cz9weW2d6
 oJFhQt+yY7pjuXATIXfCBEILZw4gNA8=
X-Proofpoint-ORIG-GUID: bxR1Jr3F1DrstIZUED0nqExoKFDLGDBj
X-Proofpoint-GUID: bxR1Jr3F1DrstIZUED0nqExoKFDLGDBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: bd50b1f5b6f3 ("arm64: dts: qcom: x1e80100: Add Compute Reference Device")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 60db83b8985f..d1bed84725e8 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1531,6 +1531,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	ec_int_n_default: ec-int-n-state {

-- 
2.54.0


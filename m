Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586292;
	b=tu7qoPmrSiyschz9qkVURQtL45i5GvZMsEVpKw/mcZM92vlup4f72mwMHD1TDAk2t28U
	 0x46OOjmsJ8ADbyOfNLjj4u9MZIbIqsV/pW2ne5DJBH77JKMhQoD8BQ6HBKte5eEYFgsZ
	 u8Pg3bY/Ng1aChFRDvi0yfdW4NEsMMTVWFAUnGm5bhpBj1sX9NJt/zAFCOxaJ33pD8AhD
	 Pq/XIUK9K/Z+NP4UmbWFDxn0pIA9oPNrPBN3+CjXdwepnrve8wdJy5Xj898EuXocMuC2h
	 oJujbzYLEBvnFLXqhhlvoTAfT2qjs0lgs601dwFTRuJwMU1kYkG8GdvVCfDpfb2PdFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4LUGD2Z1OxVUhNrmytBWWKebaTfhvUmsQJIgh2WdKo4=;
	b=GWBSd9TgUciEM/usBf2hQg8N/biU6sYt+dN+yuNWx5HSUtd39+4LIhM+cED17vOD69H3
	 n2hVDRom0z/6KW/TyaOoQU/ifK+e4sQ0/UZc40SnR0jE8KDX1hjwlntDHt1MPZjhRgvcZ
	 XBhCgZn27pWMDnkYe1Gh9gTGW6AJfWwzB1PjDXM2MvnKyA4xMFwKF2LPkt+tJKo53eUMi
	 ZdHT1OjsnOBp0qq9FeUhnns72r+AyFDYDhcVU/hO9eZRVsK4qr/0unUvmcmcsta1pwy70
	 avW5gHu1D9GjxMCA6oVskMloZCHQ00rVsPc2fY/vy/40ketkBdEy5hJ2H1bpbRrXsTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jgj56eqi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2mJg6bV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618F8606BABA
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 16:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 618F8606BABA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jgj56eqi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2mJg6bV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5Wx737244
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 16:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4LUGD2Z1OxVUhNrmytBWWK
	ebaTfhvUmsQJIgh2WdKo4=; b=jgj56eqi3jJEwA23q3UdKoHj2IVs4IYzacZtPH
	Ohmhcb8AZVR5e6SxDb1oouW10SHbv9UACBN6v+DJCcavnfmRYdvow+hb+X+bJMM3
	b4B5tBU6Ym20Ogs0vZr1N69KQjgsvYoZeJ1sbHKOeVCjzLIE8rbtoSav882bARtc
	g7Qts6ld3mu2SmzjTD0WN37nr57niKk3r6xl3m8rxeyFQdb6Pchf45P3sB+jDf5S
	6UUYaK3iqFs/bZWInK0nzG7U29sqE+ePtnxKe1a8VtPjUwKUKPEQKhReyou77gQx
	n/Al0uVxJ/1N8CHSLnTq5BBhd2GVKyxD938p7J03qgn2gf+A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37j95y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 16:11:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b92772710so1265850241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794586291; x=1795191091; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4LUGD2Z1OxVUhNrmytBWWKebaTfhvUmsQJIgh2WdKo4=;
        b=L2mJg6bVUyUI6JOSC0rWvHXryXHNWeSzO2NcwZPq20d/LbhQ6eWADE6rtFlj1J5Mzs
         Q7Bq+NcfeuxUlFDTNGpAGNQah4bUVFAPL3/vhiNW/4AvwZfm2ngu6bOICOmzJ1BaVkyd
         3e9aBdzWgKXOwWCO2Ex9kCUq09GS+F/sgZ1lUUK5xt/nBqBWx2b65QsRWEtdy0Qs9DUu
         DimPIuaGTHtdV0zaexxb45VM/tWUKeC/shEa5PXjjCODLOhBXpNlzTcOMFQQlY4K5zY/
         Z4I1hmh1OEaktysFas8TG1J3edVhJ7Tu6bmiLB//qQPL82t22EmzR8iPQFsiKBli6pJ+
         xf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586291; x=1795191091;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4LUGD2Z1OxVUhNrmytBWWKebaTfhvUmsQJIgh2WdKo4=;
        b=iYc+za+1xdzMok4A+ka2MxV7ZrV5cTW4QqIvln3IBKLj9XA8VZkYzBZ272ZkoclEZo
         hISQKOk3meqeY4nYxI6Y9w24HF5a5wjJQOOpsrrX0d6CNJG9kht468z+3so64NYfqi+o
         jblPpMOTlSiLLZPLJl2psPz9/+ZEzhA4s7OaR0DrmdZEhk9iIlehBWnlAJ3lAlPbpVxs
         luAjJf3MvgyzAgJgaIDHA0BFv7Je9TXbht0B1m0jWDyDQnKXjWC9bvoGCKkvasMkMSIk
         Q9rIUNKPp8sDgdeX16Xm0BepbnFuRxjiQehql4aA5thoOLdMkTotWNt6ozGY2LUwrukF
         xogw==
X-Gm-Message-State: APuU4Z/QO8g0b+1w83YccNyE1sHDSToFIrmVnpiW/45T+MEO9gjC7HQ0
	5WceCnVvFpW4aYp+AGpj89aqEwBLCQygtrOZ0Q1eNsSNgdpqJDnEj0gysvrNYdX5LLwswiyR8TJ
	dUoBZqzgZmT627WTbpaotO297xUC9zl7T268McyRlRKofPnO533iQqqYSE5ZPc5HdTk1bHjB1ki
	nf
X-Gm-Gg: AYBFou1ixq7rRns852WLpZE1GkzWyNczBazDSB0/JDnEu404dAC0ODeyZDuB65aRpyR
	Kb8RP6DOBRUF2P5DWPXCKLmW5uWT5SMgrLeeWBOllNTFaSkRMX5I9hjqJHJkteqVg6FRKeFYdbG
	qWhiCfJRnVDVHoHaiucKlGLYGGGb7WqVoLS0I9x4fK478G/HxJx0bVsjfTvHa4Gg1mG1cTmzJB8
	TTKJgcfhUlTOK5X4lsjCxIBXL6Ca1IsHb9GxIw8UiZrhefq2UaUCzm/paU7xrmZXtntsnj49c/g
	0BEbyygbPMqXSWKYUiOs/QF1v4IqVFZI8TpfaRKmnDjlBnwtcvl/Y/zIOmb65dpyc9Q/C7LuU/b
	D0UyxN/uMNpbmO2YS2c1IqLpyiQT9kKD4TtvsPUq8csjRrNGJA+PN/W40QGlXn7V4Tq94gTBFzH
	TqMw==
X-Received: by 2002:a05:6122:178b:b0:5ec:3e18:a8fa with SMTP id 71dfb90a1353d-5ee34afd0b3mr1266374e0c.20.1794586290503;
        Fri, 13 Nov 2026 08:11:30 -0800 (PST)
X-Received: by 2002:a05:6122:178b:b0:5ec:3e18:a8fa with SMTP id 71dfb90a1353d-5ee34afd0b3mr1266330e0c.20.1794586290019;
        Fri, 13 Nov 2026 08:11:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6191547f8f.23.2026.11.13.08.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:11:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:11:27 +0100
Subject: [PATCH] pinctrl: qcom: fix incorrect pull-up reporting
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
Message-Id: <20261113-qcom-pinctrl-msm-i2c-pull-up-v1-1-0eaf5c154441@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK4292oC/x3MwQqDMAwA0F+RnA3YTAfuV4aHLsYt0NauVRHEf
 7d4fJd3QJakkuFVHZBk06xzKDB1Bfyz4SuoYzFQQ09jTIN/nj1GDbwkhz57VGKMq3O4RuwfH7Y
 t9WNnCUoRk0y63/17OM8LUIJxqG4AAAA=
X-Change-ID: 20261110-qcom-pinctrl-msm-i2c-pull-up-93bca429d5a2
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qENpHSvjG0OILGspIeuGYed8DR95/mcpbr3JC5vzuhY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zawOIlsCCw6UJnBvKKinLIKFGP9eaFeaQNnT
 R/HK0c/EAGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavc2sAAKCRAFnS7L/zaE
 w+TtEACp2L3URF14/tI1QXht7ZgNJhAgYs55HtBCCyjUatNwfi1z24FxQ4JbPgiwIdU83yZ3xSf
 s/QBXAsqDzPb6oB6V0xgldpQOoyXHbSYmRsmyIO2tZlrI2j//RET0QzHY6SPpdEwy+HRKEyqnBY
 c7MpBWaRf9AeDVMZBRjkP8jbG4EMODEJUGCMWulX72RcjASSukA/T5yC2tRQcx3rKhlMhXXQMAb
 cHyA9R3VTfg8DORiZ4aqxliBCkkU58y51zfoUnY2WDr03rgP6wV7vy8Myslze5hJNuhZOZyLZxt
 iuslHDs3hS2CroAFH+Xq73cQYO9o3QImSM1XtLsWY5XruI92A4CosEpmOGEBWXizE8JPM5MQ3pi
 JePuB0Ur4uor8B3nDGw+rFPdQ4S6eIgYttF0ncvs5NcyPjGQNOXLVETryYZSMuIgJUj2dzOdtTb
 QwyAEQ7Z0vj2dWYlEwq+BGzMnAaZ4/Fu6bpvg0I0j14hMHR1QeK1+wmRkEappMyH1mN8V50iIan
 gc18swCkRgaCIyUusLzYAs+/uCrQQV+n9IBSOB/Znhyo9sSE2b93jol6k0tg20pBRwCe6/my6cR
 OawC3tRcPTisnZVeZFzeCdbv+gham7jp5ssqRxvo2oW1+Ybny6VYksjFxBnAKs+RUv7gCgBAtuS
 GQbfBRt/NxaFtkw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfX0gw9tlLH0Cpa
 46Idf6Tcxc0Ivv0ENudy0SxRIDLburkZ83RB5q3gP08nl1s9gYLti3wdJ4nSxHHAU1UGchCWuHx
 JI+qgJbgUGwYlCj407IInV8too/WNpw=
X-Proofpoint-ORIG-GUID: 63XDyJrlpliTBNaNpv19zx-b75v2yACD
X-Proofpoint-GUID: 63XDyJrlpliTBNaNpv19zx-b75v2yACD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfX438vm8BG2glO
 TqXVaSDU73d34uA9z/XvRhsynTkojWJ9GlLLKqBV/+ry9k3sDCB/UtlFSmcT8Djiumwoahg+4PN
 cYTjyvfrwf2C7fDj56ZIPu2m/aJIBNPcEysU93ZwsNUtVEG06Ub++6P8DEuccgkA8gaV/KOdxEh
 z70cYCM/8y01nPrav1xBjffgOJeTnmdB5bX0kxNfSzAIRNVA3V5gyYkr1KZVUhFSKG2tDtO3Czr
 0X3sZhouADxs4zFHpz2h+Xaqq7OH1Vd7lCLLlKgUFfOpUUxpTCT7t5fMPio11aJjXi4fa7hvnml
 kmDZ05uOxyUFjGnmaKNmgdO6GkFn2dAMPc0k7NYOvSqvSsuktrRKwiUPlYSjyxQvS2BIGSMEzeU
 89S/keklr1vjzwZBcWfzAKZtRo3PZOLMC+4RCNriHp5PiEJCp1wm9w4nyuHzBGFlao/o/JYCCzv
 /Q5rFM2r1ptc3CD4xig==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af736b3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gl397SsdjGjx4eaZ7aEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130064

In msm_config_group_get(), querying the PIN_CONFIG_BIAS_PULL_UP parameter
on non-I2C pins incorrectly reports a strong I2C pull-up bias when the
hardware is configured as PULL_UP or PULL_DOWN. For non-i2c pins,
g->i2c_pull_bit is 0 and the condition is always true because BIT(0) is
1.

Check if the pull bit is non-zero before comparing it against arg and
match exactly what's written in msm_config_group_set().

Cc: stable@vger.kernel.org
Fixes: 099f37a539e6 ("pinctrl: qcom: Add support for i2c specific pull feature")
Closes: https://sashiko.dev/#/bug/linux-42fe82f8-2ab3-4bdf-9d87-6f46c976e49a
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f953d3d9e0980c535e08ba1c1765d835b8abb88e..7230780ee8d2982c56f59738e5f92dca7ff5e991 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -396,7 +396,7 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (pctrl->soc->pull_no_keeper)
 			arg = arg == MSM_PULL_UP_NO_KEEPER;
-		else if (arg & BIT(g->i2c_pull_bit))
+		else if (g->i2c_pull_bit && arg == ((BIT(g->i2c_pull_bit) >> bit) | MSM_PULL_UP))
 			arg = MSM_I2C_STRONG_PULL_UP;
 		else
 			arg = arg == MSM_PULL_UP;

---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261110-qcom-pinctrl-msm-i2c-pull-up-93bca429d5a2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


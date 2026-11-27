Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794945;
	b=Y+wD8GTM15Ewa4ffORabSOIud0SFo/p2IA94xF1F7kKepBFJ12VJbOdxu2CpUrmttgrM
	 oCLdCCshGdAuCijiFiCgT39mWoHJ9UiGdCI98cOsyok9WLZATu9yUp1+PnguHCWvLj5dY
	 ytsmci4d+sSx6ewgtl8VaALoS1cmTiUS/JYQ4aB2dB/FoxbjFI65MGcqp3YpsmqptBvxX
	 usO9MMJmoaA17s4jft8fXae6eTNyU0Xux4tHgaDvWhbNR7r0OYd6tuv60PeB/h5yaa0iB
	 nA3vsqkolqDAa/0HGasjncnt+FUOSArVgEUPsr1myGsEB94M9H2zUsoTxGP1abMqjMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
	b=5d8LYuBvSb6QGY11NnOSErXiAukXBHjR/5WK7ZXwnXgrekQZc7JyzbZ2GXb19ciq/CrS
	 FWb+rcGWfqDw9AzrHCSAM6vbrewWhgoT17caan2eEuiQGrDiizn/dgPwGJSRKeguCV6iI
	 JhCptHLEkIuL1uXTFWiL1wdb6bXfpZq6G4sglxCwGZ+7JziKz/hLIh9iwuyZLcTts9kBN
	 sIr1wvaxWwES6ljjqcubNrg4Mbk6czUeNYou8EUv+hZeJcVUhAaNpDzxaBvFG4+cs8hwC
	 PDbmVB+DwIFxpI+C4MivP3V2b8aO77UNK4O2PK98xauqdLg4j0agob0oSBRP1pEpnIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FgOdbpEA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+DW1dQk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04260A260E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E04260A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FgOdbpEA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+DW1dQk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpD3H3560908
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6nyF58dcnnc
	G871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=; b=FgOdbpEAl4pSbM/oCGkEbnfIitB
	55t+tnJUQD5EVgsFAXej27PiwYSRVZLuooqN61csqVFG+rMwl6WZcEmWsaO0PKPa
	+Xnc6RAjX4MuBF7oUI0iPATbsa2Bnb7VhEWuBpabAWHzZJKJl+QpeDDuwLU1lj7c
	1OG8KLvHrlQ4iPgIGUSdl8+QwWtNB4doTGsFoCRX4mRO/2l2E5z3RW85A2UotPK5
	2Yorazn/srVpTQfTcLjLOcC3aPuSubpeiFzyomCWyVwcVW5eXutTHk8A8bEn+ZBI
	2wu/OLrE0jJx/5jv9nWetzst1UHp9QJBUDykKLvAyg6p3DuI/jP03KCkYHg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf9483b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:44 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67dcb5f084cso13912879d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794943; x=1796399743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
        b=d+DW1dQkdc+0agH2qgAfX2DdQY04X9y9B9m8LNdUdyriMzUo7JG2a5z/+6YaBl5+xc
         hXvmfXVI+pPCzbHkSLPBLe9ZmUmDQbDhmTDnH9Abg76vCKLFxHE+3mTvOzp2wXXSILMy
         x/IyK/PgqxjbiWspNkMAbrc9d9Q/gjxaPiLoCJagTsjObHI5H7z0pTb+vw4g5brBRO3U
         kD/FpOM0pzMPyN/0QFP7YV+p68M9pPCce8I03UPxXI1EZly0xTOcc3ueRs0zI/9WmaQL
         Avy+B8DZ3sAFuF3T5Wn9S3TSIp4bjsNaFg7YeWxGIs/lhFrd7lvf7nPw5bsVdw7Fz13c
         BP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794943; x=1796399743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
        b=JcYjQkDNQLB93An39RDW3prxyPIvaNSXjr+hKrowxsQhv8heMqs57rM6uhxqcdmzeu
         lrep6a/SB9QFZISptNyub1k7ms2Yn95Dc4HUyP0NfTmGjxby1LdS7ti8eEpcpE7uh+u6
         vTQCUUWHY6G/emL1DzCVtAliXnHy9Bch/P4uqmfQpQnURpan/OFJTcE+aA/r+K9SXL4n
         lKnc/QF1oUzBoa0+xGtbJDIaTjtpsWOz0CP2974lDXzlQIoDOpRgPWF77wvKY2LElLgl
         YSAyueuHLIpOcHhw7R3KsE4jmUOlhb6vaDyrw6iU7A7gy8Jpy7WrTKQTpbrf0cKRnrcO
         XD7w==
X-Gm-Message-State: APuU4Z8b5DAwDayZpZHfKkIJZNhW0V6NVA6iSmAnmNRRmxPIxCaunF34
	SvL1GhbI/5nwTKuUQ3ouIVc+P5v46uQPjzNW/M2Y6oj2Bc8Y0WxwCZE4ZrxfwbtP0glrQBnxAjT
	1QQFBhaBtFp2wlKaKkYVAFcbfvflHZPkSpfeM5wnKwMbnZ1RtEAN+opgSDe63EsdXirGV
X-Gm-Gg: AZFdTZdGv3+OmrMKSUkWopQQTvilzx8OCqi0D92HZ+cAY9mjSKjw+x8D2BQUx4QKhhn
	sbkflvAZ1N/O0cMftVgW5lgK5zCXvJnTVqqWRwCFpqnTcZElj8uWoAQ6gsSG1Peb6FRhEFL4ZPu
	eD9C1emF1o2DcF7YE4FVoG4yR37GrN/v27knpu2+VBaRUi79LRuW/lzpIKLY1+TCW2lOWJLATJu
	Q5+oluVUu9r4dYk8nLVFo8yuFRISKcpcNbJM4Jl7QbgXTtPSLhrCBJLTFQJw+I689l1x4kcxdvK
	3WF+eumHvlC4TkYFDOxdKQoHFdkkNBveASdh/U8XuUSk9ZUAJ8wODKU281pOBmofOdoopIIIpZY
	ZXKit01vwkjVbz9hJppTRzNKlZ04N4Txvg8Uk/5cWsm0CZ1CylihZlhuqpNCVBMll
X-Received: by 2002:a05:690e:130c:b0:674:1fdd:6116 with SMTP id 956f58d0204a3-67df445e102mr8628414d50.100.1795794943648;
        Fri, 27 Nov 2026 07:55:43 -0800 (PST)
X-Received: by 2002:a05:690e:130c:b0:674:1fdd:6116 with SMTP id 956f58d0204a3-67df445e102mr8628411d50.100.1795794943270;
        Fri, 27 Nov 2026 07:55:43 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 7/7] arm64: defconfig: enable SDCA class driver and WCD9378 codec
Date: Fri, 27 Nov 2026 15:55:20 +0000
Message-ID: <20261127155520.358909-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dxkaS0kYAJmYsSaP2pZxN0Iy9yHgsY8X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX7inWpslsryrm
 jyyreiWiJzPxRkfG7OthVrUp5eAsCpmHVwoOWDfwyQNZoXZybH7cT7nTbL+WHBghdwJ9MOqM09f
 RV7QsqQjx8aGsP7dxdyzYPSkKWvibclQ74YmeLizGYP9O8tO2r3+5qhE3Yu2gm4FSytXbGRsJhO
 iuORC0gkbKacKIULwC7g7gmoCLxIwurzeZVZy/OYkTIcZ3KzB2SUKBpuIQfXblkMfGtm8szUm9i
 3nJX09snPmsWr5j7meCEg3KjhsTQw2OnIuM7/ZVMgLdviMfiQoSL2+kkP3xr/ITLPhv1h2cTlMi
 9s0S0SaMxaWfVgD4ci72PlJsLw4TK1pYME6YhjSX7l2haCB7kLu2+WaulrYz9nx5Mc/r1po/EPM
 MPIO6opzsjsr8hHRFwRO9ab51E3ikbzTvv1NDDMEn9+NT/8eeIexEP3aY7o6r7HP69wHYjuMPS2
 k3xow1xpwnAEWXJlPHA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b09a800 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Lb-CJUeqFN5ILZ2-pT8A:9 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX8pphbt9tGO1s
 w990mhWFLhCS/NknfRgAXp5T3ANvWrqnIG34gbKjvPHrfX7XOuvLIh3qAu3lLTyB63m+pHJ45hL
 Ze4jQReNCVcZhZlj7fxVmEM/Ty0vWhs=
X-Proofpoint-GUID: dxkaS0kYAJmYsSaP2pZxN0Iy9yHgsY8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops such as
the Qualcomm Glymur CRD, the Lenovo ThinkPad T14s Gen 7 and the ASUS
Zenbook A16 have working headset audio out of the box.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..86b33019eaa0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1184,6 +1184,8 @@ CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
 CONFIG_SND_SOC_RT5659=m
+CONFIG_SND_SOC_SDCA=m
+CONFIG_SND_SOC_SDCA_CLASS=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_SIMPLE_MUX=m
 CONFIG_SND_SOC_TAS2552=m
@@ -1194,6 +1196,7 @@ CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WCD937X_SDW=m
 CONFIG_SND_SOC_WCD939X_SDW=m
+CONFIG_SND_SOC_WCD9378_SDCA=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8960=m
-- 
2.53.0


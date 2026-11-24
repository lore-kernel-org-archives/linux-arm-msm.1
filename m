Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562960;
	b=MTEJROSrGgCaaqxooFXDQvPjToN81e1sQTut/Y3wud7l+oT9phGJLlbLDeYGJgKGFqTo
	 uzHpLYc5z827nKY8r5gpqvVt9LwYemafX9TUuPXNFOPL+/cTSHap8HRLk1n7WZccuLEY2
	 pGnLtbrU0onsCxSXI4YEZKc30gcSTgO0UVRC2uJavqwLbFU11KL1SPfTTgetH7HtGtZC1
	 YOlMr/tlaDBooRBy8Nh+M0MKQKW4ByJnGY7uaVOrq1Q0fpEa1Haa4AB7eAdbIU8NJPRLa
	 77r5naYDxRfDZa/xGo9R9f0CsJQNeApLrXQKMvriysb7zbP53o3B0hKyrxllucU/CvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e1lxRe10abA5xf/LAQ3bpT+O85OTy/y70gwLv9Xlw0A=;
	b=mHPrco6OCG67E6QG4uSecpwydhEjrMUvSplc9h5SpUtzkpftXTDRindJKWyB/JJp4RWO
	 k95ICkPjo04swnaoLaY5qj4WiDzd/SR+W+2+mGsnT6et6CTp5HE6lLBZu+wypXwmzUto9
	 LDf+vlfnzDtZMwubsw17nFODaAfwfcyWz0OSWacOXhoE6uXp6h2nrGsJAqshqofkkfYtl
	 PGnoblil0/MB04BHw0FuC6urN2zd/8WWu/F8X+4G+xNRJieA13nOYeejfQgtspbjgn/Kb
	 LRHPACiuiI6vmf7+w/dDVa8wJ8feDNwPuC5c+De6mP4grSLVksbrWiLTyag1W/u0XQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqKyVmR8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B7pdEJGb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B906606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 23:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B906606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqKyVmR8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B7pdEJGb
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMavt12140400
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 23:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e1lxRe10abA5xf/LAQ3bpT
	+O85OTy/y70gwLv9Xlw0A=; b=EqKyVmR8mWLgwR0n1cuvccu+7GWFQEKPapmLxw
	CC3fL7XUXDD4lP1zz2iB2pE2oQkx0hXxbC7ptKSjAdjQcICQJpqKwdQOhA+0s7KH
	ewVZfWwIgTtDgFCk6JaCWDxR5eAB84nV28bprF/roxICmXv02/agslq+i5D8ct28
	MAu6KgFz9xpYrNhn7pKMMS6S9CFosDqnijhYByvLiBAlTu768zjt7iHd6UdgyTTJ
	eIsZGlAMS7AMjEvyYfutLwFL2Ly0DjR+P01tyaiTGKPXmBSwXlnhFLcVXFQCfNx4
	FKzzaIqTrZbayXXlLGhiGtuIXyDkFU4Rlk94wlqkn0DAFX5Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns8shg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 23:29:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so8007362eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795562959; x=1796167759; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e1lxRe10abA5xf/LAQ3bpT+O85OTy/y70gwLv9Xlw0A=;
        b=B7pdEJGbph7bYXQT8GoW3yqInTomc+0f03NCWzlw/9oWW8d8VSViZz6ZJxFJu5ye4e
         OorIyhTcnhV9Rfvp1voKjVy5HzokrixHGcBosVLpYUIPfDCDNrfAGdD82LcphPsKLBIO
         5FxjQy+2oRr68PyFZMsZRhTwdfFMPMK6F3DMIs8rGi6468Ev7l9L9Lnk3DPCC7osybnB
         YxWDCrEtj7mgXmjY0Z5SiHsbCtSKibffheIDbQz06wr2xuW6EpC6jDJfx6XyYGz1LkoJ
         3i5odw+pSXKehOyWWs7hZf35Ul4NLJB5joYasaQXpTewzr9Q5xspBzovpIXAhFdy2Xt/
         Stgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562959; x=1796167759;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e1lxRe10abA5xf/LAQ3bpT+O85OTy/y70gwLv9Xlw0A=;
        b=mYBXB9PBZXNWypOFDLzk7k7W0bFNw1ns70YXuBGiG78x75rrByrGAIPYDJiwlTVrOi
         OrUWxyZE3zzuwHKZxxDbAPAo3Of3vrjU/hD3azezzoGPsGjPbfBvJddYMEWpxXHY2tO6
         P6njnRCP3/rxkpsWKojBUjzuQG6ah8umCfyT5gonvqJ+gByczixYsEBK/evsPWo4uTqK
         FLCLduoynIJsBCJJi9VDCurGX1CAEM418AkPrBF0n55yo7WzYMvHYYuiXL5YRTEuLzwS
         lCJ5kpmEwWlw4uSKSYhGpiArh7DIimPS+X1jEvw7jdZZt3XJziyOcnT6mGJO5krGyK33
         7EJA==
X-Gm-Message-State: APuU4Z8DjQeZwAiDX97M/dga72sb0ONhXDvSAw/Fi1anlmf347bpD77b
	yu++X3/0REr16uP/o2nu2HmGzSzdaVuQe/rjUcdvYA6DQs5dWStnkbPXbIkZAS0KuItlcoG4VLB
	rPLt6EbMluDg/SwJOAxKPScxfgQRILoDHaSOs7h/kxBklcKN9qUB2PNlvqkA5YqngDb1n
X-Gm-Gg: AZFdTZcvthb1M/MbettMP5ndtxSCoVEix4mpUarmfqgdV5bcbIDckVie+QF0lK7Go6w
	JUA277OGmpoov4jlKa4qxNuywy07cjw1Zs1bzn80VXA66Ci4NeD1ma+zyEYW7SXSQYcBcW9rRTt
	fO+r1FH8L4sAO3bUQrS48LPmWKrjX5az9YghvSEbPSc7XF8Oinl6XHbmxV3tmUmdAVzfY0tEWvi
	OyjVP1+56RNeM9iVisptyngb6OqDPMPJggyZg4Ansp9VZ5ukZPbsJ/do5Tqefg1jAaT9SVeDSiy
	ihbBgb/EkUlfd73Vtoif+mb80rLxB2FWbuEQrg+ccGdm7aBjyz4a8C/ff2wFmx/FRnCe9hQVBwg
	p+Gkle9ySIJd0UzN3Sml2S6EJ0lB4TM+pr4VPPhzFbWyIqF4DvFtRbjG1cw==
X-Received: by 2002:a05:7301:d816:10b0:386:aa60:d560 with SMTP id 5a478bee46e88-386aa60de28mr9130001eec.8.1795562958536;
        Tue, 24 Nov 2026 15:29:18 -0800 (PST)
X-Received: by 2002:a05:7301:d816:10b0:386:aa60:d560 with SMTP id 5a478bee46e88-386aa60de28mr9129971eec.8.1795562957877;
        Tue, 24 Nov 2026 15:29:17 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm59500948eec.4.2026.11.24.15.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:29:17 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 04:58:42 +0530
Subject: [PATCH] arm64: dts: qcom: nord: use "hpass" label for adsp fastrpc
 node
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
Message-Id: <20261125-nord-label-change-v1-1-0d6292feddcc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKkdBmsC/y3MywqAIBCF4VeJWSekkFSvEi1Sp5oQDa0IonfPL
 ssPzvlPiBgIIzTZCQF3iuRdAs8z0FPvRmRkkkEUQnIuSuZ8MMz2Ci37B6asRaVkZXQtIf2WgAM
 db7PtPsdNzajXJwTXdQN3HxJ+dQAAAA==
X-Change-ID: 20261125-nord-label-change-d5928b68dc96
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, srini@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: JhuEP8ITVmPIdEPJXcJBfRVarm-DfIiK
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b061dcf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R4NXOgOAahvwYYLiyYoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX31Vi7FhCiHPJ
 E5zcoB0CLZrSX/K2w8rPc8fhcjF8v/KhAnQLW6y3iP6nmhWXnpwngDNH3MwRp7Ih9mxuMqupVvV
 3t2fo+lCsylSdxm4Tj76lQqtC8YReag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX6erdbQlSRg0G
 vcCbQzJZvpPNEauNEX6ITT2mE+tbzQJM8Zn0xTN3PcAql65tEJOIvxX7KGDRjKX/03lZ7HQzYPm
 4CXWrsP+EqD1NyZtDHXOabS3JxZyW1miS/TN7wsEsP5ssrOVoEoXeay9mHtNcqAvDTunWUuRHrt
 KeRWOwZ2G4m98z+ec4ViyhnpvN+Ok/67Pvz0ztPXDJa8KE/57J9yUKL2m6N+b1STFQyji+can2S
 uU9ceCknqyOjcQKLilLXupDLKYL7R3Yaq+DZN/xBt86QiwUvNxh/qHepLYFkBNfLZ3cM+9afE/B
 g7apHM8JVTTMb1SINfmo+Va+kExFawSn4MwcVJkuH1kiO5libNx6bKcGiuvRpisY8UuK4UDi86B
 rQ93SyB9CUbztaoOJQKevv8iJn99nrpjbkbdR+7nTRaJeKHwEw9nMo3M7RuoDT0FCefTHRI+JOU
 +PhsZcimt4nW7ZuDemw==
X-Proofpoint-ORIG-GUID: JhuEP8ITVmPIdEPJXcJBfRVarm-DfIiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240092

HPASS (High Performance Audio Subsystem) is a distinct hardware block
from the LPASS-class ADSP used on earlier targets, with its own
shared resources, audio interface block, and additional integrated
processing hardware such as HVX (Hexagon Vector eXtensions). Fastrpc
already distinguishes DSP domains by the "label" property
(adsp/cdsp/sdsp/gdsp0/gdsp1/...); add "hpass" as a new label value to
identify this hardware rather than overloading "adsp" for it.

Update the fastrpc node's label from "adsp" to "hpass" to reflect the
actual hardware on this target.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 56778dd444e4..5e15cdb2496d 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -2224,7 +2224,7 @@ fastrpc {
 					compatible = "qcom,nord-fastrpc",
 						     "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "adsp";
+					label = "hpass";
 					memory-region = <&hpass_rpc_remote_heap_mem>;
 					qcom,vmids = <QCOM_SCM_VMID_LPASS
 						      QCOM_SCM_VMID_ADSP_HEAP>;

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-nord-label-change-d5928b68dc96

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>


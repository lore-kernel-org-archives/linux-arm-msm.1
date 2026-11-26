Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688479;
	b=XjBHc2HnCidl6g+Ws0wExirCuyUeAnm5rbba5pSCkM7hTQUzQb8veOC3ZRS7o3OZmtuj
	 MmdE+6FPudd7ZvmvAC0Gel5ZQwdPoJH3y0wOUo8pfwkUourvdwy0Zh+ZiacRO1Fkitdkk
	 pJpE6TfKCHWKEZuChyeViF05AtvLYQspVg4hSJ7i502cwj3nCfVXV9X+WZwK0Oxc2dy1s
	 ATITNt2aDJKhzYZBISuxzmpHrAokdhEZEvFetdbJXRhbTF85zhHdDmzf2O1qDXYLSY+Gd
	 zwmO/IKiPLKLqaYAXi6xOyAz1Pa1YHTeZWn5jpiIOPmK11s6QMEBDvQzo9mHPJAF6jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688479;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Qo801jVyZ5pVTOXgEIn9rvYs6UFB5GmgcoBnc5l6JTc=;
	b=jtnhbbRXt2M9436jQ6AsXFusiJsEbPsYbYMBLnZLVsF4IYhF4SfzNEqwovOs8xdyl/iz
	 AISNXSpb3j1HgxAwUg2r3IMIg1NQmVoHtXDOLOfMWDrOrUSHCGvdGyh5pgJlaYCZ7GaWd
	 ziyWoHrbtdCWfkfM91O97xXd4HYots6Z11CT2KaPhXgo3iMh82RgtBPldJZO1GQ5IN0Wo
	 QrJjSd5S/TGgdrRQBGZti3b5A9qXFGrndxGcZBnMIAVIpVy8+fE20kteJAicYE7N3Uz5X
	 e9esNdiv9iTArFSFYlCfygxiCj7Vou7V2egQioN1NhDPXv/OUft2NbJu6tMHTRhT30Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XpN26L6Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgH4BPTp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5651A606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5651A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XpN26L6Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgH4BPTp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4mR2886570
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qo801jVyZ5pVTOXgEIn9rvYs6UFB5GmgcoBnc5l6JTc=; b=XpN26L6YK+YRDEHV
	jDi/3qa6IcnfYcuMF9p6yjcTeBY+lQKCwiuLomBx6ItfZ8sNGAEPCz3wCq+k3q42
	0WidG6V4QKLQiIcWpCOi9vUmo1uqyFGZJiP8PE5diCpH26q51PSciRNcF6U/uwJA
	Rm/3o5/ldRyio0XIBx7qgQkXtQi4c+87tNs+4j7Obg0t2GuhNulaYBmXobnoOmn0
	xd0RBdCPStObzGRsofuTyIabvvFR67AZbPm6GmLSvN3/NFG1gsyaarpdzAQSwB6w
	Bs6sEJmn8006H0+gAlLKUICbihA0OVNhgABgS8Kftu/SFg8PiTyYLJNvXKWcgYIg
	4GADGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgyes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213c7a506fso63498796d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688477; x=1796293277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qo801jVyZ5pVTOXgEIn9rvYs6UFB5GmgcoBnc5l6JTc=;
        b=jgH4BPTpvhEBth9+QLr9GZ4vinwe2B/U7VKnWgF+teJJHYSh05pjv01CM2LmShGfIa
         b94miwF0eW/IKZh3+cVjHYFb0b2wDHVqqpPQ78XC9nZF10IabAFwAujzkBZM3vIACbWu
         uyFUqc3PUNM5xLChdX0Q6WIdf7RKfSLsWZzpLjQ+qsbbJ5JL6bxQq9bApLAdt8B11Eoy
         l55VAl2KttGCbuw+5AW839yL2Ug/EOfZGUeCWiaerXGKcwe2tdtN7Tn7gs25YNWLy+0H
         K1Q7hxKuKsz5FyatKfQr5X6GxdQf7SYIJcDCrBOiMUqj4M1MYM7YMCiEueZyo94jyGDh
         +tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688477; x=1796293277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo801jVyZ5pVTOXgEIn9rvYs6UFB5GmgcoBnc5l6JTc=;
        b=djelObHsliNTAXMn/RPTK5YBX7WIptwBluoFCuW4vwjGS0fC0reuP8CrlhkNoeHQgg
         vYhoFK+mPvvGu2m7TD7YDwANapJNJH2yGRN2H6NYnLQ+4zGGK8TWPxAlYaH9P9KqEIXY
         gGle3vK/vWWckGfClx+a5wKKeEy1fDdzS8VT5nZ3Nk3Qk9Cumc5sTr0p46VtxjOim8zr
         FlYKsNkLC/ohYmY4eWc8TXoCfeFgb2feznNnwuXLt4nqpD3zgv1IdyzlPCmQeoXFWORZ
         8Bk8IGkN9rxnJXvHTU6dWS/8/LziJ8WLjuWGpS0I6aDVVQO5MRxNCrl1tsh0kajs48lE
         WoFA==
X-Gm-Message-State: APuU4Z8nqyULez3Bw+TUbzF4b3dBSu5WV0ptn6hvzsOOlfeNHXsKP+wB
	US4Noaz9F7UH6fAVavLNRrlg/RfcY/7BJaIqv3+xL83u/afZYdcIA17GK2kh6wnxTAAojCh61hG
	AA/29K3eTS7iBOE0xkYXPEsp/fqOXNo2xfp/g3wHoYfamnAlEGGYM/xXkz+Tf92q94yLo
X-Gm-Gg: AZFdTZegd6SZ1Lj9kYcng37We86L5cvPwNmcmU07bh8zAo3Ojxi76U6CvvufTXC04O2
	+egTYMuufPPYLZFkrMIGdvusY6h8HV3VhWW5YO+3Mh0tJSDasXD7gVmNlwuWRV5fXPMuWCcWAAZ
	wao/ytQRO/nWo8sH2KWbf6CgM7+RnIB+qD6bkcjDkqwk042ONjPnJuARgVfVZ8rlvYYqcYBYKnl
	lIFW8mz712kuC8C8jBsrjpvia7oZtorOV75mkxruUeQ/eC95u06CV03W0+aXAiCMGwgc04mVE0F
	B+uc6FS0AISdh6f6KnU6+/JaCMFhnFKVVOhkTEmN3T9QX7tnVlApS7lfAqGANYo7rCwM1h0rn15
	V3Em3D0Y+sLxIX+4XNN6irqrQOURPx8ROP7SuObpvxrNBQnmE1EmCXx4sa7B2SKiNK8lICGl7dN
	z3tD0SsNaDsQnYhI9ZbK4M3Jhtoro2fsY6MPTcJdAkFgkIGoq5FIVWW8NEmQjqg7U=
X-Received: by 2002:a05:620a:5390:20b0:94a:11fe:4d50 with SMTP id af79cd13be357-94a11fe4dcemr217778385a.44.1795688477441;
        Thu, 26 Nov 2026 02:21:17 -0800 (PST)
X-Received: by 2002:a05:620a:5390:20b0:94a:11fe:4d50 with SMTP id af79cd13be357-94a11fe4dcemr217775885a.44.1795688476986;
        Thu, 26 Nov 2026 02:21:16 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:06 +0100
Subject: [PATCH v2 02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin
 function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-2-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jde//jTRCulxTkhEiQMYDQlQZELTTdBs4JQ7/coq/oA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTbqboIX6vcqucrE+MAjA5lt+0osRrCXuSw
 tYSmaZBi3eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 wztUD/9pDv1z6lu7SfkROslLyD322kNPF/CBj40T5xTwPuxA6AxaeLRMHwX7CpnmFcYQARdq1gO
 9E2vyZ9Dm/XUkkwmgOyttJLNmLwomWAOt9vkNqRK5UpMFPq7Z9ZGH7VeBxl+wUwJaIjZhu0u7Hf
 jxJAEh+LT3yexqSTeaSRCscQ32v1JONdbxtB0eFVJxJNAC56fCVmI1wk8Nu+WgI7NXCOu3qDfSA
 6SLhWMN2T92ZngDI/F1mnWlOvf+eIsJBtA8Z/yc7C8QAkuuWrZgrOIpRmqqKDhPdnCXJRL6B8o2
 aEBoPUpozC+5AdYNCUikQ+B1ZEg+MgtXNeSwTCVBtCE/j+C4ieQaEW4j6DPDQJTajm8A99enYS1
 grvpL+fQJe+MQkUbVrNM5FJCN9wv7Pqla1EVVR/Gj1NOLqnlLlI0GDtkqc4mHv5vGfDvmlcwwNc
 /McgxfALGXJqa+WhQk3U/JjANk0cbQOPx4YgAMqDqJw6Rkf1RmajrrUDY6zQnnC63ISCkttWovT
 GvGV5Y+YTJKU9XbnrguZmeFgSdIsk9bBXWNpQd1e+MaIUAtUlCCPNDE80jtNZSDJfbn9SetGxMa
 Cf0sPn9ICw2QBOm546NWVbE3EMkDtjiDJfGuh6oLRUE1tFnI3LXQ/GFG/HtBnnJZF9WuJKpycSz
 JKARuVErrNTITGQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXwf/BO2VuUPQq
 YrDwpfr2xPj3ElucorRAMAtrb52KYDpuhf5XHfK0aI/JzBQbh28lmgbCBxD0VWXkg5VXclhvK7g
 EhgwgiM8EXXoLEMYaqFO1tWpRjaaNrUFcHExwxMAOd5hGKMRhmfh1jbEVo2TWWFbJ6YHII6oPPh
 NJNFQEM5oFUwRhS7UDKp7Szx+EZe3IN3d6TuwfqZC7RfDW4qRt8TrfHNDuxUATFFd2Q8IKjLA+B
 ElFZzKAUKw/GqJdr/VqR6b8Zw9xr0k5Bm/DI6fP7vtjOsHXaNLN2iD4E491NOqiOK4ZnjwH8+vO
 zqY0q+48lvJz7/UjSe88gtoyyDUNqxPhtZ6dQaKkxOMpG+hsWxvqop5oVi80EqphmcdJLAVEw7O
 J0BsB6pe2tX0anvZmUW46NUkNIqLaDAQdnAM+fDjnR/UHGJt2stbhv/E1uN/lQ+ZsWhv5fUEqe+
 YBwwfjZxGEEZcHbxnfg==
X-Proofpoint-GUID: wuqT6sz2B6iZ-jmGxuU8LWf6l9gdMKX0
X-Proofpoint-ORIG-GUID: wuqT6sz2B6iZ-jmGxuU8LWf6l9gdMKX0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX/u1hj1zyxmHA
 fp+rse1CAz8LkmLZhPPlw6BaHoqI8mVv7tOhkB8/4Y5PZLAfnVMWiJnWffT0JdQTZhw3cI5fHkc
 76WcNnos4sHsi9z+soj2geratP4KRhU=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08081e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8nAbR0bechdim5sVv1AA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the sm6115 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 0524a508b2cf ("pinctrl: qcom: sm6115: Add egpio support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm6115.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 0099c474c44222c71ef281dcdeb25b7eeeb4deef..7aae2bb15a435a6f64e996a864c49371dc1fcef3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -689,7 +689,7 @@ static const struct pinfunction sm6115_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3


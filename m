Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779712;
	b=U67eAnCYPGce1aA+E9AVnWC3ZyIykTf0qLISPKR3O4a2OKZUIj4VuA0OVQeDXRqbdobn
	 XFRuMEXTYNKGY/gsNiu46kbgTv5M3cWk/ucZhrxONTbME4VmsOsdAwLhkKvR1PgGAC+UU
	 B8Oe5JfBQQJmVi2Y1vTt0B8TgCQWJk3n/m9M8NCpr0FgQn2KwMcNTv9U3wsz+IrOzEQnA
	 AmGmRZUISBLSpJ18H0T7j7ATq6cjWdmA+XzSyhVMhfgpbtCBh8jvn92skLYFCL+CyqKSs
	 0b9Hn99WlfkZHAZ6d5A10Scqx5wSTC2XyTaPCBnJWQh1S5x0U9UzjRx/mYrHDxZFqEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
	b=E9v6lDJvy4sFm3NK81Y0YLwxJduWv3Ya9ziAp900Mp4Bqx0EaHQ/ADsE4w1684TPz/6u
	 FRwdKAjeOFtdFMEGlbEnnJ61LbFmovzk6gRgOvgd7X6UZGyMj+NSmUCC7/GlUAPXhr60y
	 YA57wKTKzDmTVnVLBFhODVTCCnsrsAEu976qMVEns+w9rz0Vt0UkjBJzirDao46O9+dVy
	 R72u0b2GEf4zEtYXQpWFJbGwcHQrhONEGlseYeTCakWmhWG65Z04dk8wy7jryERZIpfBy
	 ofKn3NcGal3d7BKH9ogWOiuyJ244uDYqIVmvM+Bh3RXOGxHPM/fivznQOvFM+pMC5gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CS/jqBxP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHvjvmiZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE960A380B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DBE960A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CS/jqBxP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHvjvmiZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsHNR3609875
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=; b=CS/jqBxPR0FxFoC5
	pSPSKZ7d50UrShxfvjlymocXvhUnD+pa+IyRau0O2dnJhmov2uqCI/x21obm3L68
	dXlxEyBZgFCkJHOkb81Er3eMwscd39QjMl/WsnVTADbbnM5nktWNLi/6rxWBksF6
	K1n6QiC3LGU9Vh1/AtQI8n9/Zyukw2p66xX7UoUUDtefOk5UVdUOXEo1T7AWcDoG
	3DpsvBjw7f+qyNbOdQXFa0xmm985I/GwqbdyG40tIo7QodIxrVS1rdAsQF3iX6z9
	fVNFRmIoe0Np2TV1UjIGyDP5DbsujRtHVDszDPilKPQ84/IMHOpFLob9VAWj5TxK
	prjQPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9f0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:41:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so1384077785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779709; x=1796384509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
        b=dHvjvmiZYv9B5t7RlYFoph8sG+U2l+9Xu7W4kyZdF4CfPFbvMv3WY72vLTE/uvicRW
         Zd5Jt/fvgbCWlHg6ldGNdBnvHe8VHO4sty12lbOgO98a6lAIRGrbFaJppS1agYyP9TXs
         vACuosmc0+A9/xjkgzwS/R7MlONqdFwI/ydPIcqWbnbFBVisdcRGaYGDmvnSJ9fZLekc
         Km07xGfGS60ucqHKJyzX7qUm7o69wteUcOlRGhEz19zF5DRtQOQpxzcNOH8lhoBL0fk1
         wKO7mIPrE2HyLyV8Wh8HuCj8qcZHsszV8fKm1C4xWRM18nEbtzrPUCZLLrgjfEI5Nyxz
         BcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779709; x=1796384509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
        b=Z6ZCIC4UMC/3MzqRMW5SYfX2TQ/UiyMRaGbh1q1I6FVz9TGlQvLGHty3vurtNxqX+j
         SMq64NR/R+GNHy3gnP5rR98hJlhYg+q/CNfYw+zzPf5E4g2M3NI2YNhEPHzct6PsOEaB
         C53B0rnuTqJDLk3CK7k18WL21+xIIubUVgMTsEmxR8lBXbha5uoFnEn4+ZBybqzo+gs6
         cRScn6l/r1Ij1hUu9tI5Ck3/kyawN2XiuDsdnfvq5GrVjCiuuKfDYxpRnbNWMzJirMgD
         qD8hDJQ+YJT59QnGinwHBX7DXs+umU2LUvp9teedBvuty0fT45GajnGBcBAtt8d8ZbwC
         NPEQ==
X-Gm-Message-State: APuU4Z80lcnicUHOcnv16M3dsJG3xwiZTxY3Vxy6AXnMqHPtetshyqbx
	TXJ2u6wgUqttKP/idwSixyYooVi74zXn9JKWDLLMBva/NhrQi+Z/OolTedwAemTbkiXxl3zsuqn
	mS0wAC5IATPscQ2zB+GqTtRynlN5XkdFqrNlWbxc0W2jMj8T/z+Vu0dk0AUZ/FSDzpLEx
X-Gm-Gg: AZFdTZdcp5zfajD/bEM1XuBNORtvJ9nmVsCm+arS9yEf5DYNov3UhbV71xtSbzRO74B
	ssxTCQBbqgvwHQdfpX9WQqgB6hpOgh6HzHRN12rXah4vn48v0ifNypCP/p3wzRSUHxkYUVt+slK
	f47aB+3jpBn3+9y7jzpM9C419BLvcxH9lR3Ln86Iwg08w8D+0OXO16kcs2dik1CelSCs+mQWSnZ
	7VosMdZ8FjJVLTt2L1fvxQ23Yjvam9+GCTf0OvMfAUYrSaaHpvRsa+Lo/MYthmfQIwJnE8YxKBh
	8K4AMb7QF09iS12ifigbF0t6Tv69fivKpCwjLj38dQMFLpOkz/bjfAcWbUqEf4ChX+6fZydeaNB
	dGFPM6GDcwFdnkU3+FAm7VKx6zI+uVa86eOgF3ekqOSqNBmdW0RG1e9ISdt9vbk0Ba/HuSyNV0d
	xrfc4g1ivncGIuzAKAUxRScZ/J+XYpsT3a8OnFD7pUpcKJbcEeq0OdYrdm8QigpZ8=
X-Received: by 2002:a05:620a:1707:b0:93b:c58c:d3be with SMTP id af79cd13be357-949baa0f7fbmr3972938785a.37.1795779709372;
        Fri, 27 Nov 2026 03:41:49 -0800 (PST)
X-Received: by 2002:a05:620a:1707:b0:93b:c58c:d3be with SMTP id af79cd13be357-949baa0f7fbmr3972933485a.37.1795779708887;
        Fri, 27 Nov 2026 03:41:48 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:34 +0100
Subject: [PATCH 5/6] dt-bindings: clock: qcom,rpmhcc: document the RPMh
 clock controller on Seca
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
Message-Id: <20261127-seca-clocks-v1-5-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cOfO/lwWerFvv74BYZiZtxxqDUTbGn52r0I0TAxffcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxwBpxDUHhMVQG+XeyCyeGNmDrCcfzYqwi6e
 DpBPvYCm2mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 w2KcD/92QSfcPtkyYV8dMMTsSDHNtwx6X0n3t6nE2MpvWc2C5UyR+UXpYeCgF73fQLwau1i1gKK
 t3KKEktkj5UkGynbnum+KKn5Al+ti20lgtrrh9s3Y+QnjAE/8OXEyakvVz3nJy46jvgX2nOotLs
 Nc3YdFd3CCsqTASrWaFlwKDoTlwnVdGD6X6uVIoblo83O2n0F3fsoSYksRHr5Zp0+czHBWTkZlM
 Q7RZxL/0nOAb2cEexn5vU/RXJnRYgvZANTPE1CbaH/Al0YS1UYJdFlV+pzv/9QLEc2tjAZT/wWL
 1/D2tWj1Sok0S/t7QM0dvNwnl/osFIL5kmp5kXG7jG16RWPPtfJp4yXh5FzwSC2EHY5ChsQom8c
 7WC6eEIiynYkOPBCRDfdJLCCVccv4RAHrll7P3eynqvC52KUXeJ4Up/mmacY7J6SQ6Ts+Isz1Qf
 AwyBt42FSu1I93fmU4FjD4qz3+WDoXPxza4jqNz5pcWwwGiY6mFomVdlLcjD5dtijRq0cXxPHVk
 N8NiG2S8DBkNrgCMjGwMWdZDeqD0jUg4DTBHTZn/GBtm/5gHTf1t5TA3AP9mS8x02xNIgdUnugm
 pcoCy987Hj3CE1UgEr5MAhyZ5UCrj1EueNKdWolAyR+EXRTcKtQvP+qEN75OpvQqe7HXfs2wvCM
 dyKoQJYDW/uZBGA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX2RENpYVs3Ymb
 b14Lshle62fr1JYy2fBgBLWcuN0gTj50xTYB+95z+6sX9lX4BNNEpIfMIX0zmI8Hq/EPe2TGOC9
 AxUCmJPQmedNfVdI1P+E6i715d1pUJyuudQCE6N/lJQvCzZ/aDJUz1ifRq8iCPR6hohhPlyN2fr
 y8GEG87L/0540XZGNbN6c7moodrb1swUOuz6WjNHcluw72bd52uuXd2BK9GfTYK3NCnpwyCq1xq
 TQme48Z/BTxfjNWbT/lO+rg6xrRHJCB13zb3JH4ZYyvPMM6YA+GOCJpLoe5H56S+Tnf20CMhPN9
 27uq2TiQGw/QhnSfbUAd0C19VCwU/SWwzyFHb7V71+AeDGfHhoXXzFfR/FSfv+wA2NTCWb9n0ww
 l1w7AgnoY3yrNkziXzrZzxT/ri8rIWIgoNlogPLkN43/6L2n1MjzjQKv9Abn/nF6kAtAd2DO6Ca
 patnxdbtldRW6fJHvXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX6NeRq2cjYSuY
 UijMqglVWRw3IMmiDHecs6SGPIGZKU/N0NAo+h+nBaFDNx+8ex258ndQwPqPfsp+iBsIIEpoT6D
 BTl3/PDGHS9cWJfK2wswn9X880gMbo0=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b096c7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2pdyNXWkZcuE2R3gGgkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OjJ4HxbBuLNNjGHYTH5TxTJCWUNuWyKZ
X-Proofpoint-ORIG-GUID: OjJ4HxbBuLNNjGHYTH5TxTJCWUNuWyKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270046

Add the compatible for the RPMh clock controller on Qualcomm Seca SoC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa59ea85582d5bfd9aef5c48ec6903..cfa78198b2c0cca85888303b25766b7b01e2c13e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
           - qcom,sdx55-rpmh-clk
           - qcom,sdx65-rpmh-clk
           - qcom,sdx75-rpmh-clk
+          - qcom,seca-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
           - qcom,sm7250-rpmh-clk

-- 
2.47.3


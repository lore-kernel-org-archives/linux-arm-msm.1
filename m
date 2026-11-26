Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688481;
	b=n6xbneBUheUZOXVKkZlkkmwbiAwylTQQpnuCfWEUYn8pendgCMIsolwRTjAlSpS7zaQA
	 j+uNAJdPWjhLXrUe/rTAPZ1wALPh7lmhmR23GIQXf0x8LnfVMgeJWAlX8i7tR1/MpSWsx
	 nJnMAgpUpF6Puif5g0BW0+cVF7Y/wegMkJzgLoQ03P91MnqaQLFMAyWZMmBk4d7ee1o1+
	 GDncP0HJDQKiNjQWTQ6dD4ikaTixhsU4DwvxLIw+vZjRrVMdfxIextkT/XfUgt7RzdL5b
	 koJfuKwYcumbK4rJwUJ/LG+VB7BPpeANlhbOXtHpUfdxekbPuTycIKK67fIPv/1oeIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=;
	b=j0XlgIS3ghrxCGmUTxjh6dFiLRfDeSQSvUhWNSsR8shNXuydZw/sLJU5Zxk8ZAgbjTpB
	 ERXClxCd6tcwo2N9Cjf73fAxaoQh+/kIpUnFsx1jVWdM2DFnZpYLRrWeBqJt3onFsqV1V
	 joo8HPfq4equhLsv6tG1rl0Da6hkkn3QM68dmCgF9BHGc3ZR+t1DWKC8zMEqSbHMNx7jg
	 CnhwHJl2g66wYW1N0pxAdcQ8/+zo7SsFNFdK8mnZE6pO+BD8fsGT/OH7ODxSyRRpO6GLj
	 3a9JAlB8U4/3L0kmLkMVE/u7FZAd4dIqNJvvYnRZ55yBc6ULs9+BpDLzc/uoQ7uyx6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhTAYU39;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cENrr0Hb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A63E606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A63E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhTAYU39;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cENrr0Hb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4CW2595115
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=; b=DhTAYU39nrQZvrz9
	4eOYfjiYSTHXjmMERB/9xzsqhVt1ywAUDH4bjPVnONzDNWtTZ/gA5WaBDPW+PUEy
	HFd1RJOSnEyazsuGDDfaNkWYtTMkIBbmieA/DLclTk4SSX3cZDY7mDVtbojU3zwK
	jTU1tEMPmZCmrYhm2wxe/Y15vmUxCcUxKzS8goDgc3mGUVueqBnlRQ/3mfaXaswS
	/+7eMXS9bAJ7WL2yj634pB3Ez3eYRMQy1jGYM+p/ao5uBeiPKVcKg87ExDx48I0V
	yUh3sj5hPwqW6VANGJmijLenG6J8fO99DtPa8jUjWpDLAb2hAhiPF6i/ffHbkDb5
	1Ywo7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sapa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92134f1eb00so94603426d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688479; x=1796293279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=;
        b=cENrr0Hbr/czlFADbvqqQG9i0NLWeV/BzR9FQ+bFLVnHWVsJWwFuGHO2G+/FgU3+50
         dWfEaahp6ul2NoOdgTP340OrPDH0ZQedL9KRucYHVVFt0zH28T7Ga3YaZFXetatEjC/N
         adr986upr3i3ItnYNEoj9src/9+8Volp0WwDJQga8bYPz7l9znsrAnYNzxPV0mrhv3/E
         e9iCWjbE0N8MOLN7Xpvzskx4hqpKBbc6W9MDuuBH/XCcTjOOorMrc5XruYAiatssidCu
         iER1RloNdfjMIl4VyA0/f/BRDPQ5qGUvpZrWPELXCTiU9+544oiBI4FwSwekAebtt415
         Xt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688479; x=1796293279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=;
        b=jP15OEdcHn8dPBWFEBcmVFTpkpelAg3MA7PtOmFNCfGnLuo0rL2GzB3kU4nXJ0/q9u
         0BLI6spIiEUNxeCl4gZbPRsjfkeYwEFD7JSiTDriKzARvDJMY8o1c2iuOLO0FrsfSAN9
         z9+v7Ze5gnM+HLNYzWL/prSdJL7Dwmhal6q4ia9WRYqTiIa7Ad6Ty5TExp5trsZqT3GN
         nASWFaq1R1XPCGNzWAApTHqoQzOMgj/B7wCMQhEGwIzKcefu5QU4/53UPHvv+y9ncdRW
         0uBcdFMLI4xW1JhfKJx34jsf1QxnMT6fvv3tXAII7UxJwP1cVcuxJgFvQtmuyTADChIJ
         SvHw==
X-Gm-Message-State: APuU4Z9WKV4vRVKJIH0zxo2LEIJQQcKn5J/9wqm72eLUswqcvRl2XEE7
	+77+XHKBNtIOK6Lj+BT3i2erYwvh+Iu4nOja7qWv5gN8dE3o7SROBFXRlTUHdgA1wruwpJodl2z
	kjqF0EqnzXhrpy7UwDEUKTk/fCVaASnV0eyb2lOxGrmo3SLfOkd3PVbsaV1kMQzrQwnlN
X-Gm-Gg: AZFdTZdfeHkEZSg/OZBDM92ec7dx/seQ8crUgUnxL5phKevw2TyQUsy5wWvya8OW47+
	tXTy6HqvckBrN1NNMtjeimEoENQiWrIVo93SQtNj9mJemVs5HkhdxvcF4tvHDJF1hytILa+efWG
	gVpd99aRD+Mnnbw7d+w9GWRuA7RYlJ2rIDsOxIGfnTgiCoRSPxJJ66DqKWdcXy6yIJpXg7qY+7W
	XKAV4Lk0Z6y63cvVge8cGqi53axMHJIos0XAV0B0Xab37YALJnmEX3xceSzEGBXctX7Lr5oy2JQ
	DO0tYWZWOFk+JqGg92aR1EFRh7SF2+2X/cFGBrb4jNXysc15gfvGfaPBoTGCDUx5DQRw4Hob+qL
	XEWuAHPdIdzt5kkKj4GlEHTTesoEteKpD7+86VLO/ycCtM/frB56k69NCznhzydqPI4uTaHC85i
	CMvy/tKiML5DijV/mvAVhTe/jfnDHszJFRUbRYkJ1U7bptAElAd5Fw6LFPKiyDot8=
X-Received: by 2002:a05:620a:8395:b0:949:849d:e3c7 with SMTP id af79cd13be357-949baa0b24bmr3543304185a.33.1795688479550;
        Thu, 26 Nov 2026 02:21:19 -0800 (PST)
X-Received: by 2002:a05:620a:8395:b0:949:849d:e3c7 with SMTP id af79cd13be357-949baa0b24bmr3543301785a.33.1795688479064;
        Thu, 26 Nov 2026 02:21:19 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:07 +0100
Subject: [PATCH v2 03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-3-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eFL3sb9oYAYsuwNA1gL13bp+GdJy7O1UDpqPDuJSOsI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgT+NNSktfa6agdNq+6VkQV7SM50dlhs4h8G
 o+oqCb2ZIqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w2C2D/47uDp/aqZ1JtBZgXSYElyuLa5q7DC93iNKVCUPU+4SIag5c7bjVvseU4eZdmnhLh+yHIR
 1+2opnAbNsF/saf8qS9AIX5IQfltDF+7z+/YJtGCVJ3G1m4hF+xWmMlskfPeFZ0DJSgrmPvSplK
 GtXvUrAYF0ADcbIkyGGl5ztcXZzcQRKokRr3w+gOY5d+jyXQB0wvirkRffV6wOgLApEYEth1B5u
 fmTwgYbqfNUqnzcyaxOUEOFdGim49quKKFQ/qzOGqAgqO5U1mlI/POtufVazYiedqnp487x7jnf
 KklvJnR0rA56xpohqDVafMthX2q4M1YO/Cftr3MhcUCibMLIux4L6s9ipKruumKhVH01Bm1nQiw
 b8SpDRYOfvccOxDXOw/XtXIWig3H/SL8fhzhLa4obPs17/yJU/twWjgLGDDUbDf+pLL5dWBqt05
 nS0HrxfgqBMYxE5h7ptNqxUP93Spnn1IG6q7/U8RXNW8593svlmxmpzeXCuzlEJYZwYMFwill4m
 o1bj5phkRZ3UYhIRxECbTR/q0ezTDfwL0gQyHTxzmcOtjjECJAoNqIzvcMJiVSoqlHgGwvghcTT
 PMYOmx/tVqXjbGwycktwHmkDFuSq3/LgeFUU6Bnhxiu1rNI25dpbtN8uYFTQbJIT+VNkSjEPi4T
 xByWkjqjv/QolTQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080820 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=WQ8GYrprbdz2Ztkh-BEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 2i-5zDbUkhH9u-ALnS_2aX1ma69jnRAI
X-Proofpoint-ORIG-GUID: 2i-5zDbUkhH9u-ALnS_2aX1ma69jnRAI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX5M37BIcdf+97
 z5AlVET+inNLBI5D0aNl9oyu8n3dccQk/XFlDvG+vR0oprtTkG1f2qpPjANm1t7hhcMdEgX5aBD
 A99dnZizE3v/2a3BS5QLD1ldIIH2kkdQhSbSJvRYHv6ChWHtAy26z7UN0Gl3e4YGO6jyOVQKwSr
 uSO3csQuTgvzL4ySLO8XS9yg+1uu6XZlrSMJWmGQcDKN8tjQQqqotI4wQeWPXIE2m40E2q8reAk
 AT7JF7CpP0biCC/zXrxX05heFlwg1n6CGE0e4o7lQtCyXjVxLioaU6QLX6r4i9+JXFy25y7bZ6X
 9oeGYUbr1IFhoYjz4zbsMSdU0So0n8e3uKGIKg/EaUJdy9TzTkjpQheUH3Xw9HnNp/1gf4p5ktV
 KJMf2oHJXhtEtfArxlvljIOIn2bEpuV1Pz4RFUqcLSM4wa2w6c+shuHguyP8a+LdiZ6iVlu4Lh2
 RzFEjZt6E7AU1tVaT6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX+aNo7ummr4Yz
 K0ujGLB8FXOAdPR8c69iLG4KfV1so6EL08dwYj3hR4T+MlluO8wcY7Gy5az1d9AiV6vD+v4EqxY
 7ifz/A7PiLzeyyHztOQf0MGokRiBPi4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

Commit 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins
function as non-strict functions") converted the gpio function in the
milos driver but missed egpio. With strict pinmux, a pin muxed to egpio
cannot then be requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() for egpio as well.

Fixes: 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-milos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos.c b/drivers/pinctrl/qcom/pinctrl-milos.c
index f5079a0ce0a3ea64f301427887af0ac7b32e3734..5dbd543e6057bfba5846bf6e87d4fb6f637064a7 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos.c
@@ -993,7 +993,7 @@ static const struct pinfunction milos_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi0),
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(dp0_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3


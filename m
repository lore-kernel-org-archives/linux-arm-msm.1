Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799279;
	b=V9vBQtZfqvtP9it/ZJRA2NvjkXKgVh3xjcqhPanbYrBIdmzoMFkU7yKYK+bVp974Wp8P
	 UglsRDSt52O7PCMph9XG36KZ3Pe6uaIZmMuczAJYXddPo/rBm/tEhYT4VeGaAe9AcLI7V
	 vr/8l4Y/yBGQ7/hJWJiJKeRK2ZyGOBDx2iuDXsudo2P1fN1unQIx6jmHou1F8quh7ODPz
	 0JwOO3Y071hPaqDXWleWxWzRb1Ag0tR+MnCtV90IDCsmXJHhVqZuVjalmKMkGpezDm3+W
	 FVA3ZmM/GhNErkT61iEOSQONOBXYAbyw6aCGTalN0fnBTxxGSPApgNpJl7ZIzsVrdmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=;
	b=3fP1dGrC1mQyUU+mRRamL+FZNnM4bpYjM2P9fgULGkwVGWYWGmF5fbxljQHKHNi/Ts9o
	 RfNG5tEbgi9H9GNpjxSNyDPO4H9iWSAZJyWL01PXuBDqcJQHk/tqMnNZj3PZbsjJMz1uI
	 RafQ0pEohinFBBSyvQ+Xay6pLIBOCLCBTY8Y07iwaW62HgzjXZK2UfjR1yRjmnvoQowRS
	 LtFp/bOzP+IyE+nHCqSKxciXCYogcyHKGER55+ogKs1s+Z8kvYp14p9kW1PQZXlRsGwPE
	 UbUmuBT7uJIwbou/lQNELaCQ+Su3tzRDr2AmWUYp49OH/eqOpjrZ2wzI7Oix9jg4iLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cn8KZKcE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dE81wKZ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCD5606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 13:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FCD5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cn8KZKcE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dE81wKZ3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZmu8739125
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 13:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=; b=Cn8KZKcE6Wg/6XTH
	BUZgiHb8T/y6msyUSEhepVFhIyYlaXNv0hCO2bDZGtp+mf0mwOQCcR7fM8g6DHaH
	fA7HcuGHmJpSDSis4QQPWcTZ3jHjlIQSY+6kGecmYMWcyc3RMWHASe8clvvgvDzR
	vKYHdijS7bTtX/dW+yeTpiXW+2hdb65fZFSyyL+kJxX+fV/xB8m+eLfwfBfbXSdT
	jTj4mtbrdEzR03Mxovcb0c4//5cqOaLb9oyHCJcLSwJ1+qR3IWNVbfj4DToYCq6b
	r4idOSHmRKjFGmRdGJQwtp8RZFEgk//gm40gKSuMsce1KB2gRUkY1UVeoBcN/PUA
	2SayWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163h75m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 13:34:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so236975085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799277; cv=none;
        d=google.com; s=arc-20260327;
        b=XV6wRGVn12i0oHmiszY2k62UVT2Fm/Cx1AARfONz2+mZmmZtKy/Pdow7mzlcaMg59r
         n28nai99t7VM3VWdrJqj1ELHPhdYhd3kJ15jFA7WgjUn7LP4uEoK4QokrZKVzWpAAbHv
         ux/mYl4WEBEGEQme9n+6nlt4jTUzkpG75Bjzm/UpWEq4OA4CN84FAOq6msucxsg6pnIa
         nwwoM+yvnMXtdELrDjuQ4mjNnNXpFfwFN4xxU5dqW69wPzVrIOWwKWFQMn/2Vp+jRBpz
         bzB44qubTF3Xe7hu1ds8fSJzlMom/e+XodQ8jEuyOLC5qwAMK6avng2i8O9XTLKmVRuj
         uOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=;
        fh=ozL+nXWWdGy98whGnj8o7TQrcJeEPLYSi4naMIqn9E0=;
        b=A2U9s6Ez/QiHg/3OvTJ9MEoUKSFrirfPRRV1hTnBxfztOv+8d2LK+KvV4vbfV4Xg5r
         fXL1oZwZSl7CZ5J2yIJDElYBhHVz3mtjbavGEZGL6Go3eZWxyyh444UGerRUfZ2TYWY7
         zyyC7LkoN4O8ZA33g9Zn3L+JwzyFNZOsJEej23RyxQCY89KIB2PH/0L03kt6+fnAN//a
         aaNODtumql7ZD8K4guxbNFZeJ3AeT4Ldx59hClkCofPiJI5/jZvuBW2F+Ns3Y27Fndlh
         jwm8VMX/r7gL91wJLeOYEGOJDc7pPppAQnU/sOxjxndV8kVoV+FXICnqSJurHtphuPZE
         hHLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793799277; x=1794404077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=;
        b=dE81wKZ30NAzzlEiQYNfp+V/WCOucils9bzffwvpBqQIlekQQZMhiUnDJoFCyzscr4
         B93XFUbdhildBlgFlb6RhxbOmXa6PJeNA0JmCrLwzIKxzPqzb9zCVf4aetp2AE/DY/iq
         rdQ1jCfLBt5Kol+5PvHVnHvWYiCaV/QVV8u1KxMsotIN9gMkQ6ZONNtbEnsFTtfMrjkM
         olQEBqKAe1QHjzG2ampEkhCrKJ6bi0KCFpSAp/QqpaidR/tYvK8NdLP+IO/FmrV2gr1J
         7cJ/aOC1pYpNiHzZ+zFDcqvdF66PwYCar2AxAHTUxI1/pc5n23T8teItNM2lJJ0C0ZxS
         VS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799277; x=1794404077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=;
        b=B5Fcm4c8m3j0Z1XDHFqVKIX2xeF7RiQTFy/0ckt+Ho6iG+6l7iOHz9yxjLesh1Vak/
         V+wcCy2I7hG4yatkFshq9DxeOa65wt1+vr+8wjwxt4xsMWnlfgLHbOeOmXamKbTRNeJI
         IiueE/Z4oVGhSwW2w5ZZJwHAuFeT59+/8R8ckGPse+sl8WbjSfVGPecVQ4BTD5Yu6bSq
         jNvVcny/5BHR0Y1e5gXnvOYNEV0LldeqPfxs+/U+DTCxfGmb/9nuXwKMirNuHqBQTzVW
         Ul1TVIg4QeUDYJzLJrHdWIzCymzeauGBbDtary71Rfy/NXI2XplV8kJkWppQuhrZdH3e
         v+8g==
X-Forwarded-Encrypted: i=1; AKwUvBw78+3EJbaln0ruFOKkuY9uvY3475bv1ihjAP0yq+omWSkFvNwHzfGFbpm5hZws7mKPMR6InLfXFtOH5Vw3@vger.kernel.org
X-Gm-Message-State: APuU4Z9TFTxHDJLh4GbN3Hj4k/nifq8EfEFBrwXlfzP++Ut/p9KBjt9i
	sEWn5RyNHQRn0G/oDxfM0sSpO6C06qyLgrqe3DmjHcayUGvk1By4c0q0y8NDCrB6YPdzGqj07gv
	SOnbEVNlp/mIrOB3j6gxKNF2IGKWGhvUpUgp2BFTM8D2vQmrOUWLkUSkF4smCS4568OmQRxfwth
	ySRy7EDE1NF+LOUvCCIQVn80/aUGnDjIIvQz+3ZXQoc8w=
X-Gm-Gg: AYBFou0zTeS0Yst7By1TfidvY8I4cx1ahSzX1f42eOjG2z2odfUrcDMVycSHH5E4mAK
	AmR35IRlp4rv9AonOzatFVam+qoGbF3BBitRKCXoLnygjiHNFjVknXerjhIsJNsfSrwUUJLwxVN
	BO3d359b1JdN8Vym9vp7ZOKVW0Nh4hRhUkIJYTKvzkzuRptZL20ZdZzZ0twNnc1KkqbQxYOGq4y
	DNcXk06K4zCoSwXj8SNFGL4QP7VTQZOQCPn+M7EbpvQTEPhxGMmeb4xITXrCu72XGDIbIczSpU=
X-Received: by 2002:a05:620a:2806:b0:93e:c12c:fbbf with SMTP id af79cd13be357-94421743096mr2741357585a.76.1793799276644;
        Wed, 04 Nov 2026 05:34:36 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:93e:c12c:fbbf with SMTP id
 af79cd13be357-94421743096mr2741354185a.76.1793799276161; Wed, 04 Nov 2026
 05:34:36 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:34:25 +0100
X-Gm-Features: AclHuK8sIP1g3VJCFVQu8HgJ15hRg7BjfVkjbLkQBCUavzjFbEckrVq2BEzz91A
Message-ID: <CAFEp6-2pxr15MFTUZ9XJeLS80bQqrPec3XqvS4=Xkp2UUNHw-Q@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX"
 to "csiphyX"
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: O-SDZM0UOuaOcFPMfam9t5t6yyuML_t5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX+4TyR+etMrc4
 Q43fQnk2uDr/Kj/CzYIFLOIeRPDpkmkZUIy7yN4VulI8TdoVRPKAFbfMnJfX02Bc359e/YjE8SC
 LrNw7Q3Mhiar6R/Tt6TpdSKa5Q/wA9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfXypkbYNhkQizU
 vMF84Yzd++CFE0Vn3IOtaDSB36MHHUjreKDGcMcvXk3IgO//tGLyY9RXqdhdPQk3u+rKtVRnSBi
 mtPsSUMn/S5lX8fEka6/QRH1zRYUiW4mgvY8bS7MRbeT4vM5XpHIss/ECbqH3PNVDWMFKuAjOHj
 Gorwta2fG/lzKpclIb7/kOkeswUKQaXiKrsPaR6S0WnqtsGv4KTt7gIUH4B7MVA2BALL2Ih4p6X
 slnTHUes/jV/+aUpcXA3t6DZzfKMwoQytEJBuYJctfcnWtDfZeTmU/5CahdLzDWljq2aM+2gJo1
 UYn1yJglVqdJ4C7Uze3VeL6d8BUFsLH/9JQtK5cUDjxzRaeAXEsAuTM0ih7FVezmzKgMpkCFBgI
 lZeEuBoJkByLhIF/9uBIwGwppivDJbb41xKQNqih0IZ2bYKpLkeAUgS6WQugQb17Y5io7cqPzlB
 6AI+CmZMkbZDfagRWsQ==
X-Proofpoint-GUID: O-SDZM0UOuaOcFPMfam9t5t6yyuML_t5
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb346d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=D63WGRmcolZUcHqz56wA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040053

On Wed, Nov 4, 2026 at 2:00=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> In the CSI2 PHY mode CSIPHY devices are named as csiX instead of csiphyX,
> which is inconsistent with the legacy CSIPHY mode and CSIPHY media entity
> names, and it may be confused with CSI decoder names.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef228..dcc005674d8a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 po=
rt)
>         csiphy->id =3D res->csiphy.id;
>         csiphy->res =3D &res->csiphy;
>
> -       snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
> +       snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csip=
hy->id);
>
>         return 0;
>
> --
> 2.53.0
>

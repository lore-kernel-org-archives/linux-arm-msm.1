Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE62A479886
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780813; cv=none; b=lhkEy+TUA0JCHTBhj6eGfAe+6IUzk+UArDcdw8CHL43wyIHGH2iei1qFn0sKZIyIBxZ8Isl4cXRHUgjWY3ZSgVLQG1yJolD/nCs2vjr5Q+kz6Jqmz8EuqsdMWUOHLaZ48vP31PaXzKu4bN6Q96+bqdc68CXi1J8KQgxvWVLW4jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780813; c=relaxed/simple;
	bh=rZh4no+oFdPPXPsq8sVxETGHIYaHBugYPenGQTICKAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZcAoYJBi802rcEivY+74o2hnwVUaI79N4pBXt3ziCxCBD1yBzhZMc5ZCd4wcc7WuZDddCxQ2uTKLBJ8Wu42l1/F8w+kk+nBlU30Yn5xKEZNgQnP95UgeHGGXFVCLH/YTw4Okrx3212UjgGHEn6j/3UZdL+Bk6G5BFPuDoU8npo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUC/FrDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm0qTVvO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUC/FrDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm0qTVvO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnMK63777326
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 11:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U462SUlZWjSB02RxjateNW4W
	PG4RjfYVxegug+fdJyk=; b=IUC/FrDE3+3dnqQhNKDr4C3sUUpvA+rwJKGegMtp
	9vt48/UTUStMXW7Z2i82RnRqf5FWcxlhIN/6xBbyQxUGASZVo3q2ugRqcbZlOki0
	skC+YHsz8wTPMzFA5nYsmi6CvReNWCSN9iBW9gf8DcK2zjNOBJV5SlXYhCsHdroo
	GyT9ohdhDY1wlyYJRdmsyt0dJNip5LJ8zAvaWmpp9IpJf8RdfJ82sxvVcAMaxwxX
	66EcW9tAQzfPbAXmOonb7xVWJJMalhLb2xAoJ14OmFknTL6qhrxYj/1ZHHgaU1MA
	AOJODo0s+4LpUcXAJupoat4bmXHcniRpxOIQq+dvUYHSoQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygv7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:33:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4683091a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788780810; x=1789385610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U462SUlZWjSB02RxjateNW4WPG4RjfYVxegug+fdJyk=;
        b=Qm0qTVvO8eynBHl0W1U0i6naDINHg0mHhGeN9ZFuspiCKN7NU/li3xZ7oVQU9xfz+q
         y2ookh71lQxRZXJOUn+jmbbvAkKJjPohkqdZ+ngf0EkIbHCwPa/jz2lctRdBXQ0jvyGF
         6XkaVa8TqLebtpZVETd6ManWnm+JyYH4WRBE+j3TJsjO19PnPEzfT9rR/9ptM4+pBr7N
         U0tHvjkvWDmDL88yUgXA+pC6bxN02hn6mkRlVUdnqLU+ejVwd/Rhlm7EwWUhreBk91p+
         2Wh8O7mVX0nM5k3PFxK93UjX7L1uEG59CK+nruoKcKntTLDCY5onIPVIL4b0xDlWmY8K
         EvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780810; x=1789385610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U462SUlZWjSB02RxjateNW4WPG4RjfYVxegug+fdJyk=;
        b=VB9xs/2yKW36X9/eHksIJI0PI9zx5dBDIcVZM4CRENAhtYBJ3V6XS6dio8+gSzyLit
         OgpLJTevYcRhLhv0mMc6hyggYg553re3hDyQY+d/0T0LcLS+ux4jmoFXLkcTPKdsB3Bw
         VSdu2OqZwQZrLkOw/WbpkNqCZVM9cWCtdeDHZ1ckJLeKqlhVxiO/Gdjs/rFsdDCDnTQN
         Puq3afRZugISrS2xFLfp/d6DkjBbMyS0Qm5CqiIvMad+CkThrXFYIzvNIPSgEsofajrv
         XWAcH3aRreYx3tgWjy3mYcsYaQ86jkrcvDsiKqls7KNfwhawXPBF7K+Q1PpjV01Qiqmn
         Q6lA==
X-Forwarded-Encrypted: i=1; AKwUvBzhO33Y7d79OTHLWLoL+ZY2jJINH0m2tEvlsGW6ZZsIhZDmNs9gqXh+zQx7IuRYDhg8Gx/HAdtqFYzZdRaJ@vger.kernel.org
X-Gm-Message-State: AFuF++ldi4rJVDQfRJtH+XSeiW16v76IRdLUWuwAJ7YpDqG71vTlmbiw
	ZIDQk1x6+Xtu6YTS4gPu9bLBtCXA3pGnpXAoezvfZpOHQ675ytMP1jg5JFby1WX9kIumUrMtSMg
	bnJTMFXgJm6kKuMMVAZz5u0iGwv7ausPHMXNhmhz+ExEX+3NjcUix7l5n4f0gU+rS3aJd
X-Gm-Gg: AYBFou3I5ZJF0+sSyRcDPiGNznDTYNkBxsrWYsiSfAAG2GmS5jxC03rgcgDL6IdBDZH
	plndO0Cvx6Ku/I13TauLJH1qzSK5JrXB4UTJRXhqJwKpvBMYzX4AumRen/DuGD8sAqsqMPWfbcq
	84eulcrnzIxfRekX2b80GdbOjK1Rkole6JJj/RqBkWiuxeefJpRQldMxt3PKbVz4fIgWrwTmdrI
	uiJmu+nZRg7WyvmJuQdE7vDrY22l5M9kMBKBijdG4APDfuaCewPTpohnZjMNefyziLPk9Rj9c2e
	/Wmp/sEf91hlLMiJ41aC5DWtjPrS+d+FDXZiRGWwUQDD4oVV3W3CmYyPxrbJnWl4hhA6Ftkaz8b
	0x/GCiPoz4zK6gmTMKNmOFgFWGYRS2XlyZpoYO//N4CM=
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr35276862a91.15.1788780809762;
        Mon, 07 Sep 2026 04:33:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr35276743a91.15.1788780809266;
        Mon, 07 Sep 2026 04:33:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14344a86512sm3773726c88.10.2026.09.07.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:33:28 -0700 (PDT)
Date: Mon, 7 Sep 2026 19:33:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: qcom: Document Nord Ride
 Embedded board
Message-ID: <ap6hAhGcPlu5QuOn@QCOM-aGQu4IUr3Y>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904081619.593602-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: D_oxa91-7xCYgXtuZ-vD_f7IJsAk0PFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNyBTYWx0ZWRfX0C3uMfoe5gWz
 cn5YOqUQ47gjjLFG+lScdeuB81n3Kt0wHQtwseNL1cwNm8rLkExTubbMAcO1Tn7fPr90rNRBCKL
 XuiR/NIhsFHI+mdROxls17SAyjij068M4ITR1imCHT5VI/yFw9OJxJs0gwyaCxPZimGie8zYDSN
 VlcuqkyHfaHPIKovrryoLJoad4nG7S65MpLX6/vfax3XnLiAyCehvlyOUUqG5T/2xC9QiJWiO/Y
 Y12uAxdxJo6VCJqEW7SHuTqg3qpe6+VOKyYgeRm4EyvNBmp4PfMSQHyAwu7cOA7QX5fIwj4SY+x
 uSd8zMIwcJzjz98XiXWXaU9af00Upmm24PqiB5HA32SKyy7rlPSaTwn6bkyDrU3223JiV09sbbl
 Wwbp9W5QNa5+gCtocnqe4wFrHr9AIYOJMBaF9VXTkys+Ud+HHlFdxPOXvrZ0SvuWaCFrmO6Owut
 3qEyGISeuBrTGXwHYSg==
X-Proofpoint-GUID: D_oxa91-7xCYgXtuZ-vD_f7IJsAk0PFb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNyBTYWx0ZWRfX2dJi59F2v/Oe
 snjaQewhWYeTscQt8+GRfTVNOkjohL5w6cPL8zjRpBnsq9MTXgpWdMQuqJicHDhhmb1+sXUvr4u
 OZSDboiGl8jm2E8XBn9UpMzApif1yzo=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9ea10a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qpVXGJN02MuQuz-xvjgA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070127

On Fri, Sep 04, 2026 at 04:16:18PM +0800, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
> based on the Nord SoC. This is the Embedded variant of the automotive
> SA8797P Ride board.

My apologies! I said I will update the commit log per Krzysztof's
suggestion on v1, but I forgot. I will do if there is v3.

Shawn

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 0759969b8aa8..7efd837b0fe3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -407,6 +407,7 @@ properties:
>            - enum:
>                - qcom,iq10-rrd
>                - qcom,sa8797p-ride
> +              - qcom,sa8797p-ride-embedded
>            - const: qcom,nord
>  
>        - description: Qualcomm Technologies, Inc. Robotics RB1
> -- 
> 2.43.0
> 

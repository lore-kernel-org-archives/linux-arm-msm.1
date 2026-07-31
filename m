Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D543C3FF8A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498864; cv=none; b=mpBLbSe2eX9ZdZGsSBT/aQ657k01MGWSMWEQraJit4MXRH/e1LIRWK8b5U64D+LeU8PlUyEkUoZTzSD1Vl7UJW0r94OtGudFDpdPa6sbd3zMZs785VTHeSotTuLNJCORKM5vClGX+UtiQc0nHZfb53o3UB+0OBdVJRbX3xzuh8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498864; c=relaxed/simple;
	bh=IzQXO4bw1znijVvOeuLNjQtxOwXSBx2VmnEvTIcRN84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieR6BG+pLgL7m4qJ7FE4uHK0VNYErluSL/kZhhDfKS60e1V1ZxYiOBsBhmj2n3+QZhqRnQ6jK3WQyE914aT8kb4oIke0cLmKzFaS5n89e8Ris6upZZsfvUPC/XMtxegQoRFgEDGbVKPikrBfp6dFkX1KJS1kXWHoEaX/N4sVv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBMy9otJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq4EkvQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBMy9otJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq4EkvQD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBbDIa4080513
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CNN38XzctMaiPX+j0ATyIw20
	wZmKlDeQciUomHjio7c=; b=eBMy9otJpU+sv26D+q88s0EhkStAT5WQ59Wmv6Kr
	gT1+57qszhC3zKisiqV2sVjw0NqxYndvMWSXA9HqQYUWmMwqqtyXPZusvsS8b9yc
	GgqqceFzgtOfQ7M8r1mjr0ww65elnoPhK9IDS+Eggx1f4uI/CCXzt8ToFZIWOLTU
	g537dJOdMNHKJdFZrBQhg04n0TTWyd3AR66qfZxMwvk6KLZu+cb6pqBcC4+YAw5X
	5nZU008NiUsr1fNphTxwuPrNuuGfOk2JQ6uBAczk8qcaGAkIQCqtKzOaRBnNMiWn
	oMB50OvkGScj8zmjp2/pZ88kRfqCC1Iz3USOr0vmfuHqVQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru05820v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:54:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90410c668adso10708956d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 04:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498856; x=1786103656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNN38XzctMaiPX+j0ATyIw20wZmKlDeQciUomHjio7c=;
        b=Dq4EkvQDe/sasJdLR2ugvYMhMybKB1Qp5kmlzxbiCTKtnynH9mJXdn4fqsQNYuR2rc
         IJx7uJ/le1eaX8WamoLcRJGut/LL5SRKF8c9BU9VCn9wzQpBrPok8djiF6kYl4OSL1Pm
         frQdNN2w6OyfzU0af2XNlceh1GT2/rWp9SLAdqy3mBMyIDt4c3BJ6Zw25SNXruleZxgz
         m8EKpJ3YAoNhfOi7KB+A2rPfgK1tK5pXEsmIsrrCgB+y0zDpP4ZLv7OzInd2z6SQjshE
         mupmqEzfDQjMBn6bugzVdBvDWSiMKduk8lUJBNddF751UloWH5/Ndmu6RCFub2r7GMLM
         TeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498856; x=1786103656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNN38XzctMaiPX+j0ATyIw20wZmKlDeQciUomHjio7c=;
        b=KpMfcR95ZONL/szM2MX0XprQYEhAFKI+PSd2pguXEsjspdaz60Q5EdYFx1W+pJSZgH
         OxLXvJB6wfW4HAk859ltZMoTG1/aUOe9xBaNTb/a6ii5c1RqSeDEhWpDHuzRPSXgIy9V
         QKMnxLCSzHgqAmLBTX/pwjPMfZ0yubpGRaOMA5dzA9PGx3xZW8VRdTnZB/P6myPL+LI+
         XtXICNrAFwgJ7lhRpuAE+/bQSmupKu/xybHHHlIAIS2ju+YL07PXxvDgjD4C5ml74Oxz
         diLWM52cdzb/mPJGFo1Bd1RCMraFge/u7se+Mo3S/r5wHPMv5sYAfkIZQFJsYy8UHaqK
         h12g==
X-Forwarded-Encrypted: i=1; AHgh+RokwhVhr6NZXwbCCDvMH2a6eBQTg5t3y5USIr1kfL8i1k2jWT+pUpycOgbp7TUFoQbvnykDRTVc+5zEYb4B@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXStyhFW4qRFVbEGUIMUdhwqrSk9wUqrV2NHynyvN6WwZJETw
	9c8sWdO9ojbUKcFgBNAxv/RkyoN8mVFcBZ/Da7/GvVVfAzAbYhu75gBI0r61bLjkg1qH79spHyF
	EjCFEuXtoZMuxdzrunueektrliQlM1qgVSlix5rOr0zVVc2bcB2vYDHeBVfs8yB4HPWhI
X-Gm-Gg: AR+sD12oLIBXHsd3J7s/ypTXRBadH7szR3lpy4J93RUSRnh3a7oUPE3WJUs0Odq+iNJ
	pCfF1eWOwEXxWxHABa+sai8DAU4aqfnVIgwv8W6+PCKbWg94V/RWPV0bRanMEIZ62u7KiuPewsQ
	TWkUX2fOfKCzd5aLvuobJKkpLcK+XvEXMCIa1BS/OVwWdMIAzBmbR0+m6jVBBI5puf7p0vWh7+b
	HfuCuRdQjPXBenI78qNe0K9+FAQ33DBoF8FXKs+70MV1VdB1bDWDbokfi99nwLgu/asVfAb/YDQ
	lnOs1h/sfbtFqBLCGIwdFNHkjAN8bG6a2L0hykqyPpPetZEBqzvwH6FblcrV9QxOYLchtGpzJAF
	B3LY74dMU6el49gA=
X-Received: by 2002:a05:622a:4a8b:b0:517:5b2c:6aae with SMTP id d75a77b69052e-52b4aeef489mr22969981cf.13.1785498856035;
        Fri, 31 Jul 2026 04:54:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8b:b0:517:5b2c:6aae with SMTP id d75a77b69052e-52b4aeef489mr22969411cf.13.1785498855423;
        Fri, 31 Jul 2026 04:54:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91bfsm4467318f8f.15.2026.07.31.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:54:13 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:54:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
Message-ID: <vqft4aoqantmkymrosiikk7agnl63bbb7o5nq7iwuxul2qry2m@oz52ozo53fnb>
References: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
 <20260731084032.3106477-2-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731084032.3106477-2-ravi.hothi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MNVQXsZl c=1 sm=1 tr=0 ts=6a6c8ce9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QXUQ5p6r880U3D8F7JkA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX8o0LMBmVWG0e
 nEob7y2Cmv61J1IxEGUFZAFNqjx5L4D91RRV7lwdxtRv9iISy6mGV4TlKZk0UWzDf6q3uPnKPN5
 wrxje47c/rNv+wo1fAKAALagTN25DiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX5Kq6B/3JRYAa
 SkremX0VwVaL2pfj8Eg3XdHwyejZKziEMh9g5IERLOqWZZejU7p0RASrMo0XKzLhK0QLIVuMZn9
 utFQ7nbmPw1JNfMUaN7ed5t4H0pYvU85+R5kosEIZB8t4/7D8l93GDTMod37Sn2brZX1skyVNIV
 Wi7/K+a83W1bNM8OnviuVrQ0geMG3ZzrnvxIj+KZum3FrrKlbnCs/BCYCJ9FyinYbkv7Wp3zmsm
 Gu8Wpr/AeoC0A691ImlinzOfq93iZ/Z3sqJ62K2V7YAc0ygXkMqFn8yZIjMw6IsOt7zTSHWkj9B
 IMAwK8MuLbnKW2Uj81889yc9zBpDbJ1/5YdbnO1TrCHO9UJOMLm8ILDyuDpQ845+53caz1BpJpz
 hJ3BnSp3CxQB8HddipRtAJXL1rSos4pPLwwjJfuu1C1+uSeoprkFsqk8ihWHQPItYCbJbhlVYqL
 XnKr6I2osDUC9/HqM2w==
X-Proofpoint-GUID: 2MPg1ny0xroj7UF3fqExjUBqoi3d_6BI
X-Proofpoint-ORIG-GUID: 2MPg1ny0xroj7UF3fqExjUBqoi3d_6BI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310090

On 26-07-31 14:10:31, Ravi Hothi wrote:
> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
> defined inside the LPASS LPI pin controller node. The hardware is similar
> to the SM8750 platform.
> 
> The SoundWire controller is kept disabled so board DTS files can
> selectively enable and configure it.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229838;
	b=jKgzVhTEgtUWvquuvEK43ThIF2UqRmR83KmGM8+pLsB9V4ZndForH/x6oonTgbj7klBp
	 dKTo8qJetWtmCd71HrbrKaKO7boTovWcobZlHoyTYjSX0A0Th1Ad7MNxoiTByqCTBIEjw
	 0qiilIUN0SLrMRIqWPCNcn7BQaNh/atdVTAqOM1crMYlyLAkUb85VZmMuTEjDyAaFqbib
	 epLHnp8s03XVtkY2en4rA07HpyQLGToweswV+AicP97Tfnu4oOlXUbsHl/jkizFsrQdxi
	 01jJUOKi1l4F1l6+AuGznkv4ttrnsdAJlUFHq/gTG3XwfkVG2wTIu1UUXkZAjC6TizA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=;
	b=Jg+if8KS+vZvT+yTnQ+TrhBtBGpEgprxUbZROSajtK1b7lgjBGRsrHVfCBbommKa7Wc6
	 VJfFXjx0nNixnsxsTJ2ppqLpjW5k2AIbkgF7wXvHEQ5GygtcPHzjJRXfLyvfMEsFIEtkl
	 9Xfnz/SrkGFJY/UxOlgb88duQgoJxGdNkZPIfQ703U0aVUy5SAoP27VHqdNpI9Kg9Njds
	 c1NtHBRZkbgtNss1ZwwB2UxqZKWol2rKCFhpgNKkk6JmHn+dXaLhjSbwbuJvwssFRmAKw
	 bgiFp1wUL2bZbjV3yQC9tBrfuDeBbYbFkXi+oAH6flDx4A59KDgLkbYZ93d3yrVR4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k/1lxwbO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RMhgqQ/8";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF52606A333
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 13:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF52606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k/1lxwbO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RMhgqQ/8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9AJBHS4127150
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 13:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=; b=k/1lxwbOE4uLP7VY
	MujD+j9Rh5noUzT/4yrskSNS6wTzY+zyyYhKGXcRYcC2oZRi8QTzrHJ3mShp2tCy
	JldXh9BfcQxQCXhYl5podohUWvhuIYtOr3atR33Vhi3J2/An3iDrALGWugu9fd/V
	BCX57x8g2fQhu3xrUUqnydn2tR+z5JTPPBGeaQuvlfXGoCr5GJSXT81JR7GUVLvc
	ub4bQrSpLpYp1MnYURxWW0zXAfqO7SU9NmMdKJTTu7OtzZAmR0QnMcXsTPYMaJkf
	0ClzobaQ1lXp9iyd1quFUkg8WLgw/aQ4aTHz7F/Y9rWFgCm0CJwEQhfQZccfgnpA
	dV18XQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8hej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:10:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5476f5bd009so3287041cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 05:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794229836; x=1794834636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=;
        b=RMhgqQ/8B1ixzrL7KIk8+Ia4ZImzMFBkbSw/YBbwUW7hsIU0b3UFZ1aWQcRYsOnjTA
         tZShaaJegRh27O1Loz1YElphTYVYPUpWDhXEjzz4Q+SNxs1ru28EhRUxqssUH/Ts+Ppp
         x+bSyPcqisg9o1mJBuz2LJEwnmcdmR8Fw8AWn8BmiBUE1h6JuUoUT9yAGq2Sgr1XLNjC
         ENvpE5gXhLUT4NlZhXezZRrW/ndbiRqP3bFcp11Rw5RegxhzUiNXvBsY3CqmCK+7iG5A
         3N/5gNHWc6QR2FxQohmBh639h8n++1bfLPsXF5pqkb9zICsReqC4P070XCZNGncBVd/6
         7YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229836; x=1794834636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=;
        b=QEdnwWzABf52OJcL4xaH/TMmSZVcfZ/ULAfrXZ1bITr+ziCen52doe0ZxL4TRAobXB
         w4X0tFHxtEI5kK5uQAdWqdp4V2ELI1p7yYyZZoUCkQvYxoXunv8NnjbeEOdi/b5yNs5F
         Ra7iR2DiW3Pk2GOcwYTAFebUaTj6aiWe7StvyK86k+SsqLrriHTkoiI8q2chvLzF9MTy
         j0PKXibHVJ1e48K0fEwOe+CO7b0GZONmwJM3BOh/eqfzNFq4ygmJwWE4FPcgE/mNNTRW
         xZDENgiPzAM2V8oZZI8RPVkHG7TKLpEu2PEHNu/+K3hPYLQmBSQk2B9LNsCu9AJwOJU9
         nStw==
X-Forwarded-Encrypted: i=1; AL+hErF9G65jQhSLJVBKOEHBy5M1+ZDG7fhYqhxb86OX7l0VuCahM+dsyRKxk/3dFBzdIn0Mr84eXfWJwDttWbl0@vger.kernel.org
X-Gm-Message-State: APuU4Z9OcefxGzlFk0jQHInlQtQ+ssEFQVHRLIdo9sVD6PkGd0/9h9Ai
	briiu95wWDkDXeErCUZ8g5V+A1zj05ROpiGd3mB/Ab3XvMu/c20LKunRpIpoOPL2zqPHAa62i1Y
	NEOZxUoit+vjUauxNjS7YmDdNbwtK+mZYxj692VYAczQ83jSGAIAfV3mWrRYawL9Fo+vf
X-Gm-Gg: AYBFou2Xx/R7dmI9ey1Mh+XCuCExxMvoKvcURJ80ZCSI5MXlMb7UAYhfqCBsqhHXz+G
	/QOs40vN4KEzL1ErhCQb+uYS+DJfdnY12Owy4jmea5y5etJqW2Cdy1+fEFGN8xgwN6Yc08i79lg
	Jotkx7fMccWw6dxepPdWYivUnq+9Bd1UXS80gSexkSlN0Pz/vyWO8DnHEmBwn7vBfOYH1d5b6SZ
	5FzXwyStCD7ADWGCw0OzjIHDak52RhU5R4NBpFDUfY691yvhcFb6T9ntg7naZWIYj8ktiuhfgnU
	TNXBEplTLz7q1oKubYYVdNhMn7NONLb9WSw8VNCGUuqU9Um7yHMAV2mxApiUbEPkn67yMGHnt9K
	fyfiBrMobC2cBixNY1y0f4Y0H3XCIAKVUd5hd96X/jq2k5Uuw1NGXfVXKzjvVEiyxHDAkXw==
X-Received: by 2002:a05:622a:e487:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-552a46edbbdmr59576791cf.3.1794229835826;
        Mon, 09 Nov 2026 05:10:35 -0800 (PST)
X-Received: by 2002:a05:622a:e487:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-552a46edbbdmr59576271cf.3.1794229835244;
        Mon, 09 Nov 2026 05:10:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc273sm905653e87.24.2026.11.09.05.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:10:33 -0800 (PST)
Message-ID: <86c73833-99f2-488e-ab90-114f2c9d1c19@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:10:28 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sdm845-google-crosshatch: Add
 display panel
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfXzPnVClRYQckO
 n9UpwNts4Opj7xpVHyVsL2PhTB66oEHOLRkkcInxkgFM0xxpZuZk6kWK84jB2xDouc9ijuQOqaf
 JR/TTDndwX9UgveYBO31K2gGk+fToderybqS3/tCbL3uRlTb+PxdvdHsDRE8o1w/swFQOKqnRpl
 +ZxYqYk/KsGzXhUVhILBz9Uj/AFbzZZGuSTqvZtJaqdaJHLHMBCgwciDmwj1t3uA2U2SW2XWLt9
 OaMfEwAaC5g9kr1nSOcuOySONCP6vquE+P141kRhLsfxPYUxkD61AZPuyWk+hdnVNqrP73xD3hG
 HsDnAScvnsVhj6ondxXexBz+DKh56uM4SQ5AoPvg4YJ56XR+L7ihPKwuQPD6MsWKXgpPgoQ7SJ3
 2cHvteap5hMt/RAuf+1SIbmnLWcwQtQxpJ0Wz+hTCRbQEtwITYFj5wiJR6STQtfXuyN1Yl4R81T
 lsn2x1NWY/tO4H4+1TA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX+7+Bgj4xTa8w
 Yxrvpm+9lcKsq2RxC5Gn2NfMb+//Gw3GX5c2p8gg/kbJS+tL2u95HY0DR3b8UsBAtvFAo4kD9oj
 q9Y7JN7cKtCV4GD/N3fKQvf6hSZSwSo=
X-Proofpoint-ORIG-GUID: pV0xVrx8snzep_ROy_n60YEfikMFwI82
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1c64d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rlgZYKK0SKzbOMFyHoYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: pV0xVrx8snzep_ROy_n60YEfikMFwI82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090052

On 11/8/26 1:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Wire up the Samsung AMB630QY01 AMOLED panel on the Pixel 3 XL and drop
> the MDSS/DISPCC disables that kept simple-framebuffer alive.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

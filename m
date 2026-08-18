Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A83374E42
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047345; cv=none; b=MPEzmghQ5AH9hAJbb/jytquTG1bYzSfWpPhgA52pMBnV4ks08NakoCY0b8uFkj89cP0n/ZxdR8S60v3SxXx9XtdTNHrtPazHfv4iWeE48A0PxrFcLLrs4zLbyGw6oJkSIB3j2sdMA/bh8roJ8q7GU12sBiAI1DcrxEHz1eMSZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047345; c=relaxed/simple;
	bh=BZqcWaqu+rq5FB9tqXK3e4Bntj8NSh8srxUuMqjzxEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6XOEOI+SMflCnBQ3sSRKDR2Oc7qqX3YZPD2xu2OlzBswwkPUVxD6kBSraJW4JH3ggghic/F6ycOBo3WqM0stQwdbFLLfpMAAfupPiHS94sarsmSddIupXMc2n82NbaBveA7G5w6p94wmRXDwF6eRTWZZ1keXnJRk4hcQZn+nYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBJigU4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h57GfnhO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBJigU4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h57GfnhO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BFJf747627
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=; b=mBJigU4sVcEo/i0B
	jSrWWvtdyhApq8UdbdXXExhZr5FQF8dPZULE0kY2hrihDqkDTI+sfFKSLs8eIlhN
	ouACxr9VBTgsIb1cWuziMGllA/Aai8zjDNQEcDllYglxezMNQFRUqLeI2CQZJF7z
	MvhRXssijPE2Ow3uhvLVfgWnTLB73T4U9gFJq7lbjSglMuJwst8a1Eiwex8QsiD3
	+Dy25i+R2fXUBUNnHaBSdK81HiKhdBoGqwVMsxQzG0WOryPeZQLNrMwMUwGgGiWC
	PgvA4cu2xjoZnvI7s+EDZPNVbmlkkVh3QWh+XkDySGsPm7sG70NhfQ2ayOnYuqom
	OshV9w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0u3yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:02:21 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738be9df36fso10481137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047341; x=1787652141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=;
        b=h57GfnhO16f2OkrQU+Yp2ZabOI/zzXD2UhiA/IZNIVTZBLJE/UMlYOZv/UVKvw+3uF
         2I+hBdyD9JidASgdwtR09ASuUVeBJmfGWDPZ+gnMUjCstk0SQKzRocMRsg71qsosDnIJ
         QTRj/lTar9M+Z6GP5rY0ONuM6isTlmo4ThjxXDdbvHbmovNqPezp9LwME9l8bTZVy0Wp
         e/VxRE5IK/eYRhhBEVT3GydXXu/LE/1RBL6RZlszAeUJHd4Q1aLMyWxwbfkKG/ZH5Dmi
         HEv0ugDwwGZGQievBYzW6IXrePPqKJrbwQlFX2rW1MT5y4u7ofJMelvUyc1PDWINmOY0
         pE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047341; x=1787652141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=;
        b=mYzaDOy3Esilx1JuOUOhhWK51w7PMtZwI703jASq4G4xhN3O2o6/jPjBEk6WoV6uNW
         ReQ1NZQxUY8A0nfiDkyrFEjKle+PFDP3l9uyzWM/cWHFPokCLQ/iVHzQLoD/sDK71OP2
         9WgKfhgly5pkPg05YbzE+B4xTdDuKhWtuLKVu2q3D6LqOop7OPS9+F3bmuj/P8EE6wpf
         n0IHe68Jx7eRSEgCPCQKNkPi9FLM8L5L612y8IiJ7g/NVz3VRfDUxyaRHhrd7cekEJn3
         yfu32qKzd9JYV2CrFiZsEyD3OeI1y8CP5qLf98394aUbOM3ZfBZFGb6QHTiGrxUZpwG6
         fyCA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1G1J6xRpQMryhbabWilfng/vmmj+LHUAVOAH1YrsSQVFDgx1K1buPvEGE3Jxnu+7h1QoZUw2QT2TLQAmS@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeqfx3QEjg79I9pKPX/2au4RZfKbmQwdkfmIQ/WsQUULqQTWu
	MPJQ0X4spzrsJHgwPgEKFe/7TIkLNDXAf11CkIqQrWjxMOFhbYfjGVJDvXbzu5gTUQusEgzNVlB
	mef2SQEsyOpw+7nrrYQXw/yEO0b6+gaM9xR7oXDjI4F1YhdL7bggw1Pq14/P8qCrMmZGg
X-Gm-Gg: AR+sD12QR5PB+ovPy4aLzorSKZ4AC3eB5Uxi/hVcLI/bO2XxtTsfGJCx0S2Ut7a6WEd
	r0cdYW/V0AVSrMkY3Pv8V6ZbSUQkv1kC9ahMgFZZciv/ebo0Iojr6Ls0vcshhq40lOSZ6dsj584
	FQH2QMrQOrnTL4boiDtlGQajKaBLam9ue44TBl3VX3VJNvkz4J8fAGoe9lskOG7p7F9uyw3HFWT
	Wo/C4WAD/sBlXqHxUkkO42cIQqkTQS+/x/waaZgtE2rm+NysfhnyLqDHclo4LDf1poOjjWWptLQ
	C+FvCTScZcDYVSM5g8MqQVvlHhlmsUL5dufY3nbhNDBHDthmiabeJhuyY+A5A4xW8xGFjfX0cMr
	MX/ug3r3jIHKzLswgCWRedHxe
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2244162137.2.1787047341163;
        Tue, 18 Aug 2026 03:02:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2244135137.2.1787047340715;
        Tue, 18 Aug 2026 03:02:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596d4csm1517213a12.22.2026.08.18.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:02:19 -0700 (PDT)
Message-ID: <c72378dd-edde-49c9-833f-d107f6573989@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:02:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] usb: chipidea: msm: keep the glue device
 runtime-active
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfXxVp/FS4W1kbt
 1kOsfyDpLkfLeJkinQLnWjnKrBWkl+SgH82Uh7fU3bpDx2Jf3noZOTP3JfwJscJzfCLVe/YQ5eg
 +tdZFAULrne5tI8MHq+cx4QKlU3+hJ0=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a842dad cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GzGGmIZ6zSJ6oW9ANs4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: r9yXYikMuqTd7wnL-wlVmJ5oLMTTdv-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX7pGNa7HuXzpr
 pX2XTpZNtBkFn761qNGcH1UWSoYbp4JTv0hYT9jyUF4O+ed0WP83UNJ+FE1ATzNmfS/+SrMHQZE
 tU7eWUEp1wApGlgyA2JwH3aMTDfx21UpZxAouX5b/xti498mKjNnjb7oCTzOM0WAfGVZOO+k45X
 ykAAfzqfdfDkhpfg0tCaF9iovBcynTQmRAzJVI3x3IRgcmZNjjkr+dJDdV0FSr0L9l2u0l0GS39
 S5dtd8j3G+8iPvEIkbte2v7b311cjhjT96lPhId9YcE33E+vTTXkW3pmHrmRzq/Ni1L3dY9WsYJ
 zRyG23CbBSgE5hAKPm4gJs8q/gKnRPp4XbzJre/yMT2VDaFoWPK6jwdp8gZ6Aq9ixiWfU101ShA
 rkuUFXwdDwmz3rbH6IaLFM4z0YvKf6QGiXqN8BQMhbmcsXkTt3PlU22M1jhU694imtovrpnHi/o
 QDRNkwIMCM9kZreIaOw==
X-Proofpoint-ORIG-GUID: r9yXYikMuqTd7wnL-wlVmJ5oLMTTdv-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180073

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The msm chipidea glue enables runtime PM with pm_runtime_no_callbacks()
> and nothing pinning it active. Right after a successful probe the
> driver core's pm_request_idle() runtime-suspends the glue (the ci core
> child has runtime PM disabled, so it does not hold its parent), and
> when the glue sits in a power domain - the HSIC instances live in the
> USB_HS_HSIC GDSC on msm8974 - genpd then powers the domain off
> underneath the running controller. The EHCI register file reads back
> zeroes, an onboard hub's connect is never seen, and subsequent bus
> accesses into the unpowered block wedge the interconnect, eventually
> taking the whole SoC down.
> 
> Pin the glue runtime-active so the domain stays powered for the
> lifetime of the controller. Proper low-power handling can later be
> built on the child's runtime PM together with the HSIC wakeup
> interrupt.
> 
> Fixes: 2d0cdcc5a0e4 ("USB: gadget: Implement runtime PM for MSM bus glue driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

FWIW downstream seems to implement "real" runpm, so perhaps your
agent can have some fun with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C8473C84
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934472; cv=none; b=ob15O0KHnrwwky0kMWnZTtxzTp4di/CNaPPxuHZDCDOmNEQgPlkzfNOxftX+9DCuyHab1f/zrGlTKXRPNSbAfOW+g1lJJftmbCp5nE39nJytqtvTUthK+jI9RSM4SB1A2iiFbPWbImFYv2xGCBT45yZvH8cyNK1doa5im9mCcXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934472; c=relaxed/simple;
	bh=9NFwvwjdEu6EpliaWOFU74+LC/R7K/xtZBjcetkEVj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPWT+GlMUbb3+TLkj5HzrZ7VjzIRniy23BasH9keHy3nyG2xk8fF5KF88sJr23TTh8wl7p4nDTGivrZ4HgzwR3GdEIQwkt+qw2AUYh4AKJQ23nnBd5BPTOmsgc2eawf3svsQxC0iWWGih8AZKLUl+1MqVAu8HhD7hH3A2f7ARuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdpC91Pi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgSKzqnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdpC91Pi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgSKzqnn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j7Jj233762
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RDxr7B1Xhs8FyRPO5MY0yhhg
	tVLuT6+k7rHf1WY5blA=; b=IdpC91Pi+1XRPC/UQEnhaP9ZlLBx9/Yi68IbBpsg
	wXIKTgCGwAG21e8eM9FAKfQxRk70YM0znhUEjkyOXKREFh2iTqa6iCvn7cLankep
	SDjaOJVHI2i6DIvEL5723icvkJx3QEPrAs6Q/CVw9ABBZpUIOjuDeS8BeATgch70
	cKEFS1nHh2Db0AnjP9oqOAtTeX2xqaBCUBT2On5h2TgSJLyFM1zm/z0TEj6Cz0ik
	hRL15kLJGkuC+XixWOF+UWbyjo2TnxaRhxARBeUgrugo0tgZPewv7rS+oDeeSA53
	wTHTqxoMi+sgnWRRJO0RRVichFoGPyCuiguEVoLdjKyn7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9abgxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 09:47:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c58ee2116so1399262485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934469; x=1791539269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDxr7B1Xhs8FyRPO5MY0yhhgtVLuT6+k7rHf1WY5blA=;
        b=WgSKzqnnzkD+pnytanzTTXXE+HgZ8L6sNFx11p9Z+JiIQdAfiZ7IeOUOa1wJD9u/T6
         p9gzQO39M0OE+V/jiUMOv32LhhedU63sy7fLPEVFf6CAoafDSbhZVQ+70gYdkDU1i9En
         StY2nDXvv/8s8JjcNinRWJUK75zdWjCiAOQkftqzla05WQtindLI+iYJqdShgzcXDz1t
         PXFGkCWRMR3ILG6wiGcGG3zUc5OUt8FHaDp0icjZf7GarPG3PTGQquVRIGAvoNuZfpcL
         5iBcK1jml2enU98/rPyso9Olfgjc/aqkJSGi/YCaQCZ7iooeBVqfI0XPw0zdMcIth2lr
         /w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934469; x=1791539269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDxr7B1Xhs8FyRPO5MY0yhhgtVLuT6+k7rHf1WY5blA=;
        b=IoyqllQjzHYHVqWqwhH3uQC+4/iCXmA+R9yf5QkyVwMq9WltYGXsK7DRqqzpoYdMCc
         r9Cml1pw1Pk7Gh9O/6VEZXjWPD12YJC/kxPaLBlniPteuy7MHcANZBpDiRi/oMafHDBm
         fXUdXjHmqT5sxEwMV8CB2qlgc2qsTYd1T327YCFDDFABmwaXaYldK7kbmB/8f8UMcPwU
         mc5Go67LtJ7T74dFsAmYe/brxpWJX8Omog8dC7VAgpGxFgIAtwjNS0cqXwj2JSca0pZF
         HEahmmAGG0huSttJWc9bC+WLq9dyG5PJ+042FqKtusR4PhxxSN6j0oMSM9ZH+6PW4cbb
         OZjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsnftHTF3XGMk9JW2q1jpwrMOqPVvyfztOgukETxiDhhQztsYqr3NUpdraAk13QAPIwgzWJWXV1PovmUk0@vger.kernel.org
X-Gm-Message-State: AFuF++mipt17gn7wcnAnDMzmjvWCddXU7gC2qy7XmiyhZMDX8j6Ow2ch
	+Gf8mQTZ+5lmPHTmJ+3Fc1TrbukymAe+cStKWR8ORJh76MBl617nWy6JsqsdbXUc6tP4UBV2l3k
	yJJt+P3BUAOWWwZ6AUa0p1NmPCCfYf9cQYRaluhMUYo+FRJRotjxRHMyqWp5KbOUtfSJI
X-Gm-Gg: AYBFou00o/9ZBUETbDzagc9dHxWoy1l3UnRNUO3YiKwt+0UaAZUGyJvycFGNU0eeDCl
	IL84yX5De2ZmgXyI6nx7Il4mKJxkrfg8+Xz98FBCt9B3Kv7e6LrRJj7RyjIO1Ia+ATbScPH6q5N
	lxM2fpiuzAkD7w/3jPVDZYJnowMwjmIgIswKAbLvAOHnIa/OOlsTnniA2EfbDH+BY7OnfzYjsbf
	WemSjtTD9l6O9b7u5uLHZOOelITbod3lldNx8Vv7nkNsAZP81PCeKmVH55dfgKOMOmqY7WvOiQt
	cModGrmdnDXjLr0nVJgkSc7XYYg4x6jWvkKE0Asfe7+mJ6S2Ipslm7e+xbdA1LJvo7QeH6ojnaA
	39eIxLSXmHcFLAwA=
X-Received: by 2002:a05:620a:27ce:b0:93b:d7a1:ba11 with SMTP id af79cd13be357-93cf18bff37mr336082885a.60.1790934469386;
        Fri, 02 Oct 2026 02:47:49 -0700 (PDT)
X-Received: by 2002:a05:620a:27ce:b0:93b:d7a1:ba11 with SMTP id af79cd13be357-93cf18bff37mr336077485a.60.1790934468708;
        Fri, 02 Oct 2026 02:47:48 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104f89sm5011766f8f.30.2026.10.02.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:47:48 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:47:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650-valve-deckard: enable the
 watchdog
Message-ID: <d3s2tbf2w27kf257xxtw72ofpwtnl5wqxajzsgw2kbgc375iti@3hqht33dtekb>
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-3-7d7f7d71d88a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-3-7d7f7d71d88a@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX7zbWKI1nJI2e
 exuCr5WTuylsztO1CwN6GH8Mo5+wWcrboLv0QcJJNZ3rJZJ5Wyxi5fleb18v4S/wMKas+pnOqPW
 ZmGAGpIKHDFr/hiXeYOzM/cHPVlmVnU=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abf7dc6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3WhsykZCFRSWcWe-wlIA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jXt248ldKT-GrUheDhOYR_-ejVcM0iGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX68CCrK8q+z3W
 xVhq/o0Y4tbrsNUoRfC+0kB9ntfoJFFsY9ckqBi8HGqqbMwxXVGNESZgF3MlTF4amhP1UDtYpih
 6rs2gu1SkK4HIxiHLrXWVS4WtUEF2QM1ugsfi1PRDYX5y3h5b4SI/jnvezt6Sz5ilUkrSWBQuI7
 lnlsZJUB4V5OY/Nr4b2LpaQKSRRpbQwNg/vz2eq4cb9TW4TwKfi10IBfKQe56/RVBgLfFN5EDl3
 TxEltEhAeamirGxMLCKc1LBz46wwzRq8oyvn7bOnt4RPWqSmXcdE5W6FjXn5kiWmMyDjgd+rz+M
 Z8/Io5azGAZwJ8KPwKL5cgXy3sRD5Y6+OezLwLoQ79EyGnBbBQcW/tKFvi4hO7q8+i8/pY1U/Xj
 KF3oXTxDEi+ga61HviifO5bZPibvWB5vimPwenZ31ZMm/XNnpOTrPdPrbfqSOiWn+M8JACzctj9
 IYw/3gMV2SMCOMgGjdQ==
X-Proofpoint-GUID: jXt248ldKT-GrUheDhOYR_-ejVcM0iGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020038

On 26-10-02 11:45:30, Neil Armstrong wrote:
> Since Linux is loaded in EL2 on the Deckard platform, the
> watchdog is usable by the operating system and can be enabled.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

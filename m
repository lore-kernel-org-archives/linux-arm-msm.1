Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483407;
	b=sSdjy2kt40A+tpm975rXVLHCx6YS1WuMxA/soR6yBhXF/qBZjPx50LuFMj9i+zT8+4CP
	 gnWAY41M/KlWnZA+TEztwVLygoMEez04uc4wp0PMomfggNHaFFL0CAU0KsJLcQmDWbipf
	 j4YW8tilkd7EtTqZS/RixsMz+pKSwTHASN1yAtB0Qnp2sON2dOn0UPf5QV2pDf8Pz6k+U
	 0HO0iw6eTwF6upkRZQ7iqmysrFpioQM8rpPA4aRk+socEunzDyRdCkUOPlWrzS7nyP+aC
	 UWaGdvvkwY/Fdav/DrhENsfOxR6kgIjBpneJ7gOJr05xi/ndbpbADhJRrJDGm0+8XtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5CEYrl9haMjCN2sIMSQLbd9UGHWcTYC3p718awO/Bk8=;
	b=GxaN6VmvRyiFbWjtnHYVpKbGHtNIE4UbjULafbzNqbSQ+MzuWhmC5rEGfIIyow6owbqG
	 ygHguprLIFjvjPnp/S0MbeJKeKas6fFS7yxyt+hSVn7acIbiNZXUXa5hliveaoxHGEbXE
	 ZMTt9PWjK35p+dPPeFqAxDAFi7hlBtDu/G7huySeWt9lr/GwVBlzLspQcg3ZSVFRapt0X
	 jjBP9woBCKtqMLn4oK4AYT4bSw2XVMwSqkzQXgSHqPZqD0uv2WrvRgqJ4AI1u8th6eitm
	 U2c8FvEE0obAuu2kWSA19pgeOzzxrbc6Zl6Iqr2nDmJmoYCTy9uJFjYMBGn+p/aB8Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZjYNNiC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE9b3j6F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D578606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D578606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZjYNNiC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE9b3j6F
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF9C93556867
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5CEYrl9haMjCN2sIMSQLbd9U
	GHWcTYC3p718awO/Bk8=; b=nZjYNNiCkssu1Ro9mj3WH3/3eFnJoJb0o9HszMMb
	TRWBC0ZDzXKevMibx/BZFuM2yjD7n3wwuIK8771Bd1h5kHW05cViQ9RrH316eCjW
	mA3zPP7KG3ZdaG6ebevmvZl1VtWzyK5yyNL6bW3L4A9l8TuTg9JP2k5kom1+t/kF
	iinJwfP1BGi1HG/ZoC4dOV8xMohSQ9PdPYDfZT5NEx7FhWBbW7w8LJqBL8bLSDRj
	oOzenK4Kzk+ugl2XqD4HtpIDo8FD8lHRL3UC80z7GW1VI+21u0tjp5hgbr6VNnG/
	I6PKxjNt9Th2ftFMiz7GJbkYnaMPc6d0jdLWgxX2nHBBHQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxj60p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:50:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7c7e8becso54800316d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483405; x=1794088205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5CEYrl9haMjCN2sIMSQLbd9UGHWcTYC3p718awO/Bk8=;
        b=kE9b3j6F7rHcBPtP2oI1uoyCHAoWHPCE1g2ROUBzFrs+LES3htK9ipZcQbSV5/HNV5
         rLaWcuOc4Cn6DRyre0wfN8CzFVkgtChA0ttd7pts0mcanim3gtQg3QjcJGcVhKS7N/Dg
         cGjTGMB3cboC5JkC1MvOAGTEQykMEq8eVfsTrdJn77jr5NLhj10yRS+yl5wTA1H7iBkS
         L0NNpyddAZTh0BxsXZG7FfAoCSbtWb1lclRCRsZnbCkq2VxuNhiaSgg+3jBiBvXbjJ7q
         fzm7qflIHCCPKvdcJAhq//THLsSSRtDVe/Q95vhygCNZRblhYBVi3gT6f7+nbk2oDNmT
         mASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483405; x=1794088205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CEYrl9haMjCN2sIMSQLbd9UGHWcTYC3p718awO/Bk8=;
        b=IU5a0WEu9bBT+7BCFT1uW0IVTghfq5JCRHPAXX4nX7ublWoJf6XQgXrcr4kyRXTxJ9
         3hffzBGteJpG4SqrEpg/8E4alMn9S1u1oRIOdHc7GJL8CWDJsZs77oeAjp/AXl18cqzh
         HVJTuVu+PtowzJgKcbd+ITIaSn2afvxMkf269U1xrkxKIwiu5h8buWLTRdloh9p9kSWB
         nArX8M4xD02ix8CIlMABSGsfUM1kvfwNJBPO+EskxXdSlBdKrj19Cfev5936eIf8cKGh
         GcvW+qVew54axOX0xvkY8UPACVzkGuyZEalHhWIGg7mjHJXs4tTprM8fu5pYLgq2Prey
         n8Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxRPMSonO9CGPIvqLq8OtiHythUI/FYPGM9tbaI8mMpLG6lfqxLY8GubF/00kFmZihEtSoEzl2iAvBa621Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLaHRudlC8e+b50lK3ErYrvsN7ZBRgz7CEb9FfM99VeDhGcjyEd
	nlr+oXeuFsMtZVR7ElX6cXRSrNm6LTzl0FIDkW4fy2WcZRNWHWDUwi6Mht9dOC7tB13ddjsCNhw
	iWiWndUwREMyxmMveBbtFS1YjA1QTN1wbGXqUOAQxDh7D6rc8dfapOQrrYYXYw3lcG7El
X-Gm-Gg: AYBFou1SYNZAYovfbZy8s7rR7qi4A3UUcxawI4YRzFiPaHp/gHmn5ucwsBXgtMfPl7s
	jnnnezKj6JlKJnXQUHkOuVV/YzwYjVr4L1oMrqA+R6fe1H7Zk79w9ayemfYwa16JgkoZvoIGz2P
	WIfD4KJIUxNBzlYU0rJ3F2Pu7wx6507x4DK42abqPJpLCcXRnrXX/wRWh2opMR0kKhgv5Gu7WUW
	6E2WiBFuQiE4R6flrS0xkch5h4PcNhOjyQwwO9hU9CXYm2Z7p1GkjGPOnYgolUlGYy482VUd8AV
	rzj1jjn6CgQDUkOQLMLLgqNpljGqCGTz8d0mUdgT14+qCHl+oB/MJSeJdTpT9XwwW7gyTTMVcet
	37TjlLD2feS9kwtwCEC1VLDybpMxsQNfwaBMFFYRejAXTl8z+4O0UzR/lGpd6u84opj99yxr0xD
	vlctC/yzHtpd5mzHbc7F6rU1e26Q4bel7y3fh9azOeOrh82S1dybAJEgCrbGorCg==
X-Received: by 2002:a05:6214:4302:b0:917:91bb:c63d with SMTP id 6a1803df08f44-91ca4b9e629mr106936546d6.38.1793483404899;
        Sat, 31 Oct 2026 14:50:04 -0700 (PDT)
X-Received: by 2002:a05:6214:4302:b0:917:91bb:c63d with SMTP id 6a1803df08f44-91ca4b9e629mr106936276d6.38.1793483404449;
        Sat, 31 Oct 2026 14:50:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbef03d4sm13068941fa.21.2026.10.31.14.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:50:01 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:49:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 UFS
Message-ID: <h5psr53lgdjyypspsxhsbnaq4xwxefchr5w2us5cmllouhszyf@coule4xj547e>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
X-Proofpoint-GUID: C9IqUIhrddaafEXBq1ggE1yPhCL8tZpt
X-Proofpoint-ORIG-GUID: C9IqUIhrddaafEXBq1ggE1yPhCL8tZpt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfX5UzqMiKYECfy
 xFQhq06mf9Am51lYf5b5AfBTvynRgDFKDuD7weH6/D/STsQKOlnPYxGh+SJcNhQFv11rqu+P871
 Eqrli0I1Js/pnyThI3+yxc6hEr/E09Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfX2IJkcvNzs0CQ
 r1PtS5C02i6mup1xKPHf0ObUPM9p3Yvl1wxuipD9Y83Bg4hCIsdFvKsd7WjTREOl4VxCCAK77tv
 aZqfiRZm/2wfvzeOFNVH9fMcDOSZgCx9FI49uKBX//WQbyEVxSCtstioKzaMjSBZ1hgQdSx6Dgd
 LLX3n6LuMY+f9t+HkrdTwK31QJFo3U9cXFdKeLLLbfFYABlk3qkhhy7LTLBok6FdG2q9YIlhsYK
 0TebTBEebKOd8p6vN0jNNYMVRVbY8czfwcM9s05hj9RXNkjHVgTYrFD0kzbwhwPwrZsOR7qb4h3
 swv5RU7juSc0mex4tslBe6G320azdGBRW72qg4Wiw7E9mOzyLsFtKnDJjotLMG4gdim0wFK8vrW
 EV/44zL7EAgSx4gF/xgulWBtNtvcDrPCm5SLaHA5JY9qgMJVkQ5QdbmdoKc93lTjkhccwD9gvHk
 nvrUwWpqqC3BW9kN8vA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae6628d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310087

On Fri, Oct 30, 2026 at 10:41:33PM +0000, Alexander Koskovich wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

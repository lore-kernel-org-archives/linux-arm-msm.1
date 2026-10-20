Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493682;
	b=xUs1XVwrHFAdLJacExVd6TtTz1nQ+NP6iZxMMRJL0sGCoq2707R0oLULtyhBAXXQI90y
	 bHR5/1edWmi+IytURJy5nJ+iA+Sfp/jno1uideXB2zPzoEPVpY7Ce8WUUsi8NpwAlZAPa
	 wbiLd9dgDxFDJV37pNFi/ACjvDLKpb0NPtvWHCglxyHEqydBqmf1Dz0XoEPTxjr+7dm0V
	 Eex16jU7gSmOc9raB1i3wtmxuN06jyet8uYTf9U+ZXZkrbV0LG5vuw6PHnbEvpv+7C5fc
	 +csU5lPf198ODn0g5PF+Ll90DhbNPFfXCknuFAM4BSFtF0Q6IN04pIqETCjMESN1M1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=;
	b=aeapoF7uT0GwplAcDi6+3voMSd37jgAg3+Uync7mriqrfOcfyfv7WNZ/OWrpDmCZX/Ip
	 wO9BFJtlQggtkXL0qgNdZbRx59CNBYzInyGOys6sM6fWOiz3ceFhRNZwUIur5twGPkp7e
	 qUCK4R6vXKUX1D4CgBD+oYHaEyY04JriJ9iZG1ti8Xk2s2SDWHWCKvGK+POV5yhrnKS8T
	 /lfPcFFIOUCabPuPb3V6wpg77lvWLe3Z3lyRuK3zgDDA1WTnNmKFAbhLzqdTqEv0noTqK
	 jW7qMUUH/v3sTqbZBzp607oLG07n3ctQ2G8kuTyM9uG1sko9BwxjVw40bqM2v9RlVAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=js1DapgZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MCs/I5Iv";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C4606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C00C4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=js1DapgZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCs/I5Iv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8BDpm3807210
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=; b=js1DapgZNnp7iKP8
	5ih505rejGgluNIme8rnZqZkDMhMxxe/Wo4KbxT1/vBmQAAYqE7ZMQmGXt3wQ7XG
	kWBjSv53TWE4GGkrZQPcWYcPZVTgdBcTqyTKyQA8k8OEXkjWj/ksws3nkULqAnPd
	tS9E9gSDdWVOAsuqfRkEH3hgHYmTDjuXqhuENmrA+Jfno4ZUH13rPyDWoiyKmFQ0
	6ccMgPEfuGK5qprGAkJXfGVXcv3EQoJFFhBJHufKIe0Uj9olhG1fSwInSd2HWzbj
	ZwHz99OJ3JMIykgfB+H0iH+xELHT8FYFv2KcpjfXxeXXdYoVFg1wbCpUz6i+QWRv
	/VGMew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pa5dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:54:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536540909e5so5009101cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792493680; x=1793098480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=;
        b=MCs/I5Ivev338Be6vOmD2yPUz91tjvbk+SU1toZXUSVdR7fkRsA6+a78Sf4ujR0osJ
         zCvLcIKVFZvlT+fV31R9ZqmreAa44QQvJzRNUvMcKYSfuwKpXotohBqIpKBQfEaVUJm1
         zl68yNiVDUHikhmmSVpnNWEVT2i5N+m0FLSONCadrOqbzf4n3sEbbA7OHxblmYWPqioj
         MOq/ob4bTQ9bOLxADRL/TXaf4iTF6vcWYMl/WjL5Y+O9XWs2hn9u0WIElSCjab10ObeF
         19UG0uEfDueV6qXV6rRrA9Poith8je2Fo2GjReIgj4hLNPkaL5KX1mdkxSM5Y+u/S+X/
         vY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493680; x=1793098480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgoAan2vCyGJABNHaoJvLyW9+0/fp2TVmgm949Wdink=;
        b=qyMsht89PE9M379XIckK6IeBjTlQjjJnnURIHvbGsOB++vdLefZrALjcKj+oZTovXM
         C/9UBN07vWPYqvd6YelhNp9Ko/HWLl0t1gfSToisYqa/NjEX3pdTCAiKs+GJZBDA92Kn
         lisLeysQOKRkG51fHoyg6szmdgbZ3Bwt9OFQZhyNxjjnr+yqj4qjIR86z1pK3mV8loB6
         rHT1PTjvqdgyyeU1KY1eWc3WZDmAQhmHTpqiTUrYRhKvygASmDDZvAdCLxO12rGy9mER
         KyNruAGkkdSbPe5PYhwAADNaYY8dQ5BiR/rCXcdJMQ5YjXRQw+mI7b0gBLyA0cFkkrQR
         d73g==
X-Gm-Message-State: AFq9FYJxGJqA37gcSteHaYRFRphikc0m+r5aZu0UgrLCVpNE4Uvpgxla
	XWGe8aCTIiPXoScLUVSzNGGlfnxHOqgZeeAd4Z81U5hclQ3VxgZKFgrz450Rgd/rHmM3BxGP3zL
	KTO00PPfmA0ucDn/F67Etk8a1TcePu5HNc/xo9sWTn/QuNJbJPrrYnGcp6T8/IcweZiAD
X-Gm-Gg: AYBFou2H0nFcfnnjDAzkAGDJSQUrTGkcAesMsyBJvHmGFJzMFqJe4tMMEJnGXRG9gSF
	zFPtAK6gwoyFV20gvozAUJQEsIEgaU1y+E7KX3x5EpG4LjVcOSYu6BLhkPocXOGkKYMDfIM05Ve
	6NInCZ/TwGsKmmyp2Xr1oZPWM/sZtovkrWanOYVsWM9kMN2y+OOi8u1hlRX0U5K+lUXp4O6/i1+
	5eYH73Zlsfv1iyk0sFkkm7E+C9m7IDUzDJL/9m66aeCRvOynhSC8wBAo/pjpbO3R6wPv4ca5kv8
	VdCa1wDHIoUUln3PepepMARol7nuGR2VkPxpmpdRDOy/Wz67RSsgu7Dh5PcE17s8ga05lnTNEDQ
	HUv1qndH10DL0YV9DPahpTQ==
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr8060991cf.3.1792493679898;
        Tue, 20 Oct 2026 03:54:39 -0700 (PDT)
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr8060801cf.3.1792493679378;
        Tue, 20 Oct 2026 03:54:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm465672066b.75.2026.10.20.03.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:54:38 -0700 (PDT)
Message-ID: <a0098b0b-85d8-4da2-b41b-7e9e73bc70de@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:54:36 +0200
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
Subject: Re: [PATCH v6 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
 <20261009-phy-v6-6-50408e45bcc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-6-50408e45bcc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VAT5bhyTHLESt8oPrsdS2wuuIg-liMnP
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad74871 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vWphLq9OX84qfFS8ZdsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfXxK6JGPkIFn63
 Y1Bb8pdnKtOfLOnWhj1VZiYYGZWKfaT6rJy+8N6xydpqeTED7otPfBqVaYIPMzpgn68PVNabI4d
 ETIZI0dGwRjDqK3XrHVQmXaOBxFhuSINEIse4rxJvPKGVl+b0RcDsm90tHb8szyLABdBNw3uIFp
 Ljb7Cu2qu8g2lQIEFU1T5C1WvcEEpe1dY81R8mh8JKe1Y4B5EseDkUWFt7oBNfXfjEwfNU31oJ7
 w+HeDkQVrB2qeKAwvmTQQEfPQYtGeTzfbUavlzdAeZZaNgumEqWtdhDadF7r+/XZ2jSQnIQ8TzU
 7QGGqPGO2XnnppH1WvVuc35x/W2mHOgY3UBWl7Hbygm1OvsitWEPSI9OBEg0/ZkLxrSLeCqidUl
 qIZVFIcvmuM62i32bz2E+sjqEULFY+pdgO3xlTzotEEDeNMJGzDzIaXvQAGX9a3HdIqzgRN+eeZ
 LwbgxqXyaQnQ1DT17jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX3rqgYX2uEdsG
 MxROWUnUp1j/ftDEm8K5Wvr2zA2Wi3PRb4ctNCrFrWLIc2qoEQ47LAaLRzy5XD0dxNKRMFTa/UH
 IR0bD3tLGXptY85ltmHIGd2EFa+v2yY=
X-Proofpoint-ORIG-GUID: VAT5bhyTHLESt8oPrsdS2wuuIg-liMnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200043

On 10/9/26 6:50 AM, Varadarajan Narayanan wrote:
> Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> on this SoC require a dedicated init sequence and override parameters
> before they can be enabled.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

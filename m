Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1063D9DBC
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663548; cv=none; b=BV6PdJWauIyq0a9r6CERKDs0DbJFAy+ktuCyPU5uKPxAHjByBAZ26oIXsCTZ3y21WZr+3253R6y/pwkO/O60IjCI0IymEYvMpTl8erlkKdr1uCNb3+af2fHfFOyZXMtNTCC7De7XXCsnWnj6hORZfaY5ao771u8s/XoZl7tDcbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663548; c=relaxed/simple;
	bh=5vSoQjlM+zxdMgIz8Dol2JEbHZmwoaaMs/VLIvAbY28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8f8lfyagweDziRzdf6Q+DjzbNUN0Vif3SPcZF3VdcYOD6Domj2O7hhH90kOCN12YLbnfROKkxh8SfXlK8IWhch4Dd7y+pJwczlIgMIHTXlfmzLRpd4bvzedNg4fVs65woLDfBscuEaU2fzv9FA1XE7SBGhrSXEAXSGuYoWx0uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ih3upoVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPGiDw5W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ih3upoVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPGiDw5W"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAvBcZ2090828
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 13:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEk50R8qPbR/0VyfuOs/yn87UGRyRMpG1iyvWD2oRYY=; b=ih3upoVvWO7rwhOt
	pW0zfvOZnbOJj1RV6iSkTKQ66LmQyRmQH+OMAlTk0/eFOGjcZUz2nmXOnZOojX1e
	gHGKUtr9u0PAngik3UhDSyFasPB+lhxzq5et+Cq4sqc2VckLqLmEaBnelrK/igW4
	MUKZq4PXWjIg+5e6ZXcCauLt0JlmFYvjX2e5lfTYGfu57/OCoR3RDIubf7OVxE9f
	ug+Xe0EFxF9jPU2dlRn2lX1CW6OHVwAVynVNtg9/Jphp0IbOzvLuUixsPX5fX7jO
	eWNy1Si71YX7hsJuRqgVfDcJpjEy9BnBOfRmXDk3iwBhKR9iaFzYZrOQXa7sLx9L
	vJnj/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvt206-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 13:12:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso49536151cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787663540; x=1788268340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEk50R8qPbR/0VyfuOs/yn87UGRyRMpG1iyvWD2oRYY=;
        b=QPGiDw5WID17iXBiB7qrWFPAsqvSLpnCL6PYEQSygC70Q+Dbn9dZF1eABD22thKibZ
         ClWRJi7OTPgSz6h8l0Y2H98rPiYu1M/GvVbPo96B6IouLo6QfgLzuDy/t3ETBeOm7etz
         aIPO8mrDavJSaOihe5KXsESvTNNWeS/WU3TeELsNmI/1VJbcGEDLFtSajw10WaLqCdp+
         bRXKoG2kVLSmVm6iJXPi9Okkh34rsZflhhxjTwDx057un9oZtxirSNrQ+BHC6W4Nj0d0
         apyEvxzZSGMlmB+LZE6z8ELGs1FNbUfQ5H9Ohkp1DpPs/h1LbCugC6inUmUzan7qt/M5
         jYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663540; x=1788268340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEk50R8qPbR/0VyfuOs/yn87UGRyRMpG1iyvWD2oRYY=;
        b=rlf5IdouRXmRtn6269RbpZSqZYjHxBE1PTkDEobaIOheqbVTT5V0Qyk7vlUD2OLVsQ
         fl/5MHtUA8dOOCQspMxxaIiOdpUyh2El/RlmzGA/+54AQi9ojwiKuGikXZRHumdXMfAT
         IehjTmoYvhGJjtzXusgc7MCdHagXjhf81r6WvQnZ1EyEBY/d1f4lqBmq60LTKVe+mcLF
         pNeO1U4cLEBYmB3Oi5tIMgwey2OwYbHELwvmuVEJKe8TxirV8nKgTsgKqVb/nJu/kmqo
         s0p+xTg0/DsBudkLF3CoO1jklROTHQhXkkccN2jHxMfz5GoAB79cGlSdJGifo28mQr3g
         oFQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSCEMn6aqPmzHRDDYa2G+LKAQk3+WeKTqKe2VuX48xuriNrkl5oPMRCDHTDWufsX+7QfBSj2CIQ5TL9oht@vger.kernel.org
X-Gm-Message-State: AFuF++lFAtrCWwkx+t4pJSETAUREQYbZ4XJPN0LV7IkB1W4yPw2K1SfD
	QkB8L/lN+jq55ekU96pq3UBDfLAZG+WlcsemYisX5E8DZ4NWtIdDBl3n+hMb4kzlC/DSKJ/mWpm
	N4Yq4IVIFjS99g1J1f7GBczM/yLLqgvXRzzmrKmm8VExKpAEKWHsXucIYj0OfNTlv3vn5hcsB+/
	lm
X-Gm-Gg: AR+sD10bcrMqEECkfl+o+POE4RELDEV0wdkWMq1ijMVFY/EjP0c1ZuEVJyd5Al68V0L
	KxvobXsxtBLH2pkwWb6btk4q27ym9EBx+pG+UHJrqqJ4Jh29Vr+LKpy/28NRG15nUdjLdj9c/MS
	uoTbjhcv+ryqfr/a2/z6foe+9iEYe6XXNx163x9oecuWCustNZGqT4Jm2lNYjyBTlpKMQ+Iu3jA
	+ZuJVkivrsWDYg0sHXNQKo2S8HDsIVXsK+szSBgEdHd2F4dQyhI3eX1GOXUXz1p8KE1nJTnAxv7
	N3aDI7h4NZ6X6DN3yWpDD0PEehkMRB+vAYBo4udYpVoTGd5XIFbYhrVLPc2QRN42iu1XabbUBAg
	DiOVl8BrRkBCG7J/Pr21HJkywftrAB3s1gGM=
X-Received: by 2002:a05:622a:e0c8:10b0:52e:a11:571e with SMTP id d75a77b69052e-52e0a1169f2mr162418831cf.11.1787663540299;
        Tue, 25 Aug 2026 06:12:20 -0700 (PDT)
X-Received: by 2002:a05:622a:e0c8:10b0:52e:a11:571e with SMTP id d75a77b69052e-52e0a1169f2mr162418021cf.11.1787663539783;
        Tue, 25 Aug 2026 06:12:19 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69b7fsm11808333f8f.2.2026.08.25.06.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:12:15 -0700 (PDT)
Message-ID: <62ebdf78-85fd-4209-92fe-acda654a2e6f@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 18:42:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: qcom-geni: rename setup_fifo_params() to
 setup_spi_params() and make it void
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-spi-qcom-geni-cleanup-setup-fifo-params-v1-1-bdf98ae62953@oss.qualcomm.com>
 <8e4684d0-d130-4c75-8b28-11fd98fc4a29@oss.qualcomm.com>
 <lxif5gsyfq24aq3vsiing7xufwdmhllmn3gzdm4sqopz2ttele@myvffcz72jqq>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <lxif5gsyfq24aq3vsiing7xufwdmhllmn3gzdm4sqopz2ttele@myvffcz72jqq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExMiBTYWx0ZWRfX6xzFqIA7u+PM
 H/IngOe/344ZfYQOjyp0H9VIiFVH/idApdoTY0W+1AVeup/yB9SbxMCq/d0KPDzUDdkTEzJCLIt
 PneyTzYYMs6Nn2nLirAOsYnok+ixdzBuJ6JZbyA+V2qIDmpJBwq+RdC66MiYiakHrw3ShTx0me0
 npZ2rxFyp4+lftI3a6F8o5qgDGJuLtcNp6fFvLrCrOoiWQpi/9syAf1e0rmj/khliHFbx4cWHoY
 VgHMvKEQXat3uY+tSmsShrhMbxBWwodmyeygyhWxV3DKDkbRbUSGrCB8P1reFNwPUkK6CulU38t
 MXQKE9xeoNre/e8svEey4fKiDqr0yRuUOqNHKhPJ8xnKLdIjWBjSF7xLwjckHxCG81t8bmSmDXb
 /+4zH4TJp2Y3urCL6Vjp139sl2czmgpuLENXO5eurEiPH6/X1ga8CLHLQee4RA8Fb+/jDnxiVbq
 aNvXjhSsGBXFCvfteNg==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d94b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=O7rPFSPfsRJ4j1pAWDsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExMiBTYWx0ZWRfX5nZ0cHtCzCCB
 ynOLBT4AISywyC3X0BSLqxAkSu95m1nWNQfHJBDdnrvCq+07n2ZSqHJA7zdQrU0TsC+Qa0IxKns
 3c5dEa1u093XioWckB1LOoYgBYrM2a0=
X-Proofpoint-ORIG-GUID: 7GvBRN6VWZwIWQamm220puATlKdkHEqv
X-Proofpoint-GUID: 7GvBRN6VWZwIWQamm220puATlKdkHEqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250112



On 8/25/2026 3:39 PM, Abel Vesa wrote:
> On 26-08-25 14:01:10, Mukesh Savaliya wrote:
>>
>>
>> On 8/24/2026 3:43 PM, Viken Dadhaniya wrote:
>>> The function always returned 0 and had no error paths, so change its
>>> return type to void. Drop the now-dead ret variable and error check
>>> in spi_geni_prepare_message().
>>>
>>> setup_fifo_params() is called for both GENI_SE_FIFO and GENI_SE_DMA
>>> modes, so the "fifo" in the name is misleading. Rename it to
>>> setup_spi_params() to better reflect its purpose of configuring SPI
>>> mode parameters (CS, CPHA, CPOL, loopback, LSB-first).
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>> ---Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> 
> FYI, there is a chance these might not be picked up by b4, when
> applying.
> 
> Make sure when you reply with tags, they are actually part of the new
> message.

Thanks Abel for pointing this ! i realized line got mixed.

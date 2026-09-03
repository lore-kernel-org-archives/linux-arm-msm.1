Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F4B3E16AE
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427422; cv=none; b=aVTzdtiPq1wRTV2+QOqKFMBUJt1+af24ON1hQ6JQ5cpeUH5wf5uTz31u4Ud1M8BuRUhXrNsZYPLwQQQR3nDZtNBhWocaK9+C4CRv1/xsL6fMwe8iYSWa/vE58cWJHoCVmDmf5X/jt/zYg8gQTSfujlT2UOB0kL7Kvec0XH0kSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427422; c=relaxed/simple;
	bh=jPGxyZaN47OWHEnJ1Qeo4cbJKb/i6RtVzZlvRGOu2z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnj2y+r4hfWpbY1hoVbUGnVM14OOyd8GxL6knh+385rAPihwYKTSZeiDZCrOMmfjs8roXYB6lwSJuiQ00jiWJKPgEcST19d/DUuBXxb+gf0Y7iMt+VI53V0AjoAGI7TjOiVrYFWQ/yFUbeSeuzQtRalJjB+pnaLFTxjk1e0oQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUGke+/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRf7rkhq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUGke+/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRf7rkhq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683924YO043810
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 09:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+WhN6t5YMVHt+2IsTxJpVEHgtlM1K+u7N828IZhaaY=; b=NUGke+/cmxlgZYfR
	sbe3UJhvHNCcNDelA+O9xetBiJm49p6v5XyUbQC9/7rI2QEL61gIu6euxFT05QPX
	jN4vxsrGjE9Xjbe2Qo0BWZmLyD0K3Jw+AzSL/Hu+jLP49dby8AWbxZ5AmMMAPq0Y
	QI2kpZ5YuNvzeTF0o22cPxkjVOWeA9ar1sBDbGH8vfgy8VoaY/LUbbBLKjW5Mdvc
	LZgB4QRZboSIsuP0Tj7AP2nKfQlLBqg8kFe5P17r16QAF+NKxaBppc9Qofa8pq6W
	/oCuTribxfqoCqE+mUnzUiMpto05INmZAmxGLOj82zIzQktmnYHpvKTwIDF4aV83
	PhggGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyh66y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:23:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934a8cd3a8bso46361685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427409; x=1789032209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+WhN6t5YMVHt+2IsTxJpVEHgtlM1K+u7N828IZhaaY=;
        b=aRf7rkhq7Jzz6L1Apmu86j5BUlzE8CQmZth0aWJ01oKOEPaXENQH4J//0S9PwBbsyP
         hT7ETjqm3DMPqjG/4ARMtQjvocOHZUASO1xSxQQ0GUGNIN9QCyhoyOfS5B/9+9DRd2lr
         FTJgfXmgM4VZjbr7ylBkyZZtwZNr9EBayCNBALqf3yMsdYivJAPv1CpDNfDsyKkxzl4b
         I6DBt+1VaisC5smA1XNKhwNRRiqr2UqCGRJOSUNOCy+wuu+6H7Sy4yCAg+d3gATzofFb
         OKxZodCdeuRkX91I7WOGVAtVieXw8caQ6oWBV5sufSoSXe5b138FYAf5MnDs2jUNNpd0
         e3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427409; x=1789032209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+WhN6t5YMVHt+2IsTxJpVEHgtlM1K+u7N828IZhaaY=;
        b=lEXSFFv70/sjGTva1vY37Zzk5iNH1nB2V2Znv5Z6Wztp+rleB2TTqiw+W4jfXBCiU7
         zcpXDIEy+49rwzbi837Po6FjjgSJtx3YyB/NwHAunETSIB3Ab6oxyz56qWKw/VmhbVrz
         /MK5jCmx1QxfcvvFd2/Bl23RrybKLyPPN6L2nEooLrJ4HltTHO/6ldOAAUSLnPbWRy8J
         dQp/T3owENDvKV9yNX5WemSicC0uaxGDXld8p/l8J3yhJO8wt8/4X2GDdFVThPXO+Y0v
         kt6Haq8xA11aLf3dFF+5X/d52Y1NIhJbB9y+1nIx01xDoT+eIx1ecgCAUSHs1xpHVkl5
         sh/Q==
X-Forwarded-Encrypted: i=1; AKwUvByvulioqKzzP3u883IQbuOTmNES8UWF5BsnD5UcGZQx1GMtBZ/dRBTo7SCIW9zwLshGsxTGxu5+BoFNkWd2@vger.kernel.org
X-Gm-Message-State: AFuF++ldag9yu7T+wjTTAB2Q0Ef5IopF3XU/tw37Ae1UDDpso2Qqoyo7
	DpeBlHH1cCMaVBZ97hZqfuUFMw2AaKgd7hA6Ssqq4S0Ab7tAMRQVX79wpuTT4Y0EwC4bXrPRMFr
	zQ88gUTiYIpvKE3rlSNOq7ODGfSA7TQxTG/uQrkYJjwRCPy/sIIZJnCYtwanNoJrDe+5nVVA07g
	Ee
X-Gm-Gg: AYBFou3XIaxoIVpY93wA+O5fiaHS1tQDO98q0T6ROQ1OGVcV2TvHHmd1qQKL5cwlMGp
	roPo3cHxYEZFDJzUNl1cV7kDglDDyWEDuowXqeFAQ5b1tJRwvsCrZp8ohDfi35JyfVrpgLgg2JX
	oaO8ejAwMfMwm/mWtuM2E0JnbJqUVUg81DXBpjKo/Jif/igtuQ4+f34tZTBRrHbMOapTk67GzVJ
	AixNftO6VydzgWj7J9pN79s1O9mrz4xOg+ELEzv/go05bh8MgPCVbrswujisrV491aQwLh2wUNm
	xFT3V4cqPzKVt+7b1EbZaW/q0bA8Dsk5FtH3coXvI9dbZKIIMQ66+Vzh5Djdz3DGkR+R4S/OeNV
	BiIC513/nUDQIrtZ8isBzEg==
X-Received: by 2002:a05:620a:40d2:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-93960fd4f22mr808295685a.4.1788427408634;
        Thu, 03 Sep 2026 02:23:28 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-93960fd4f22mr808293285a.4.1788427408155;
        Thu, 03 Sep 2026 02:23:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4244e45sm70787166b.60.2026.09.03.02.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:23:27 -0700 (PDT)
Message-ID: <92d30223-26cf-4b92-b7ed-11fbc5bd6d65@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:23:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add Retroid Pocket 6
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
 <20260829-rp-qcs8550-v3-3-198d5b2fc475@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-rp-qcs8550-v3-3-198d5b2fc475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX7qLnnKld8cF/
 Q0fCWzE545oPqqPp+HY1aamb7IvwTNcCzbThIOgbs5ewZEfih9ffaJ/nuc12aMarj+eB1lSQSD1
 TE9Vaz+oU8pBiZ2DVAX2SsmtjlzUzL5RI8fMMBjFsHQ53PNeXx/w3X3S+g/9WPGM3+jkOWRqlSY
 VgnQ48Kjv8GNZN69tMdxBObPADvDlXvfagNhdxg+83kUn4Rz8CTGcRk7J40U76SxiRFfj7v8CmF
 6rkT3c1q+FqNwSf07yvgTG38BzgUigP5RAolbrNmGZlc3Nb2w8afg5XzqRHikYIquLRz/lYvUgY
 qRvl1nZFK0fJyUS3aR1dXsxF8jGVbqOy+hR1hdX+gV1gzMyuJ8v65bcmbCrq/VLM0QG73wyvsIK
 todH1sDsr62izl5RVO34rIhYVu+CP+Meyf4xKgyfkiG5LkCdTL5faHvEGTL4ozekiy8ufFKSBv3
 oveYmedz4btc54NI+2A==
X-Proofpoint-ORIG-GUID: geK3JtElTLmSEP6dQ6l8mgpBMoU1jB87
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX1INmN6m/iNWp
 zMNhW0ZibvvhH09r8zvQ/DXyPDcX/nw9WooIKr2PRJccwR6a3fwZxuuykP7NpC6nfZJagWYCRCF
 0OD/+1Ex6xoa+8Yk4UEC1cKq/0ndN/s=
X-Proofpoint-GUID: geK3JtElTLmSEP6dQ6l8mgpBMoU1jB87
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a993c91 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6d4l0p3RcBnI2BkWs0gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 8/29/26 9:35 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5.5-inch AMOLED touchscreen.
> 
> This is based on the support by ROCKNIX, however their history does not
> show who the original author was, so direct attribution cannot be given.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

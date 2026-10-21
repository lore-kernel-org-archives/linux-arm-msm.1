Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591232;
	b=3vrVEZ1hXyH/13+hxmNTGBCFUVBGKZ1Ld3Y/hryXJOdmflgDXymQcA0lgdr+DEGNg2qu
	 RdaW4BEgiejme56+3RA6hIw9pNEIxgg+3aertvoUGgZmRgx/uz0k8rc/Qj8KNmmY2y8RE
	 la7+O7LyAIF9XUsbyntslOstxR4XdLTSRIQDNK5xGOqKP6vr4Gd20nu8BnjSTExpfM5g8
	 hnbHHW2vl/NoChmdNs3Zu5IKchIWq7+Zl4UMQ8V339J2TrMjGp13Qvqzh1B4mxS+Hi0Sn
	 eXL+auY82WQXLNAJRzWXDRhVI+qjyKu0In/j2Vyl7ebyJF6HFn6MTGblx551GxAPVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
	b=W0cOOt3wVOk8QxvRv5yh312OIr4AIX87P5bIMrWrmfGcVmnf/9I7mNYUjAycVhsZc8ih
	 0mxFFeri2AVN3MxsEbLGYgZSbwAqXqyIyZhICXIhjtRaiSbXgLXy5L3lXxc2Mwem8SGHJ
	 S69IxRw7G3lrcOx4/x5tPQxeaujO7bGJU6IAlSxbC7S77Dc4WIHvaQEZNivrO3untSro4
	 8TjbdytjLhWBIGyMyL8UBYHKbfDsAP2ypubVvu8D1B5qvGtxr9KS5Nn/fiBiscN2b3bKN
	 sV7fmvSVasmcVf1xtjskp3sMfZv77tDH+jBaSRCgFyTqsM8KD5PeRMX6eIbBmpenJ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=anFs3Ywu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EQsrY/5P";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F56606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F56606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=anFs3Ywu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQsrY/5P
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDIOkG3869202
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=; b=anFs3YwuuX1o37vW
	4zYwv5s5aGMgXz8XlFBBMG+cu/YjA00QUe6oESLTHCOM1WL0EfNjYPu/OCUcz20L
	woYdt0/5SoOV92XMti0q0YpmZPOl5UEeGCQ0zuUYY9r65N+MVWh6Gm7AKqU/LmdA
	xBQ0L6lxlHw3+1nSiTk+vmylMLLa/WD9kZRa/FxpC+U4mIVl179fBN5Dxccz6hOp
	5pfqk5yB49HeeXBBo6RhTMZkaq2QnELVvhaduiN2hLykk2eQK4g/qWh/vQuNHYDM
	l/5tPvo+59rV1uX4nzAUDK+UPxqStx4APjpKYhbdDH3Fl3JTb0kLRoORSHBLUiB5
	L/utcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q85p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:00:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so21514185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591230; x=1793196030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
        b=EQsrY/5PSNz7Ep85TauZxetW+a4dPVZufNxcgOZjDkoZOZPGnPgbJtskyeL3J4O4/i
         w8eM0fzjTPCJ5ukFV8/tUoBTuyW0/kmKzTjEXubotbwWCNRoJXJOb5DWM5ihgqSZfsl1
         FAWlBxxYGm4ETnLFnclpTJf/z6jLNgTJhBrMyc73vEdv8DteL/ptKJUaMGt+MbLp01IN
         hMvq40Xjrysaw1Fh283v2QWX0cZtZiDzhU7SMJhCg2FeE3yUI7cZxF/OhfAFvWwc7Fer
         pH5xxQTkLbZdKxHDrUV1iTGGp5G29BSPUOOmppjb+rcjt5YdWhvRkc6w5S9uTKK6+194
         6NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591230; x=1793196030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
        b=nZ+lAYXUGmbgesieI5qz6YMuWiC23FsdwVcGvrlRQvafj73YatuES5BaOc63NRhhFY
         gBBJ9IYUlx7/vcyF3xW7dLZhhNW7F85DSLjfyPctgBeAx++53r0lXW9JxZTQ2GTg7s3z
         Jox5hEwPd4g7WonYFGPXOFeJtFsWKaSWzUE9Ka2hPnL+0eCCkoMHq71EyXvpdjTjFSSw
         Vsfp3Kvce5YpA91Z2KB1Xl0LcsVFMu+fC6/EikX+EyAzgEXdQ+PVNWiqOu/mlR++/Af/
         6qB1Da0LFQDdrw6FYN+r2MI9IeawNXNAjxb4RSubTICsvIx0eM+E2qPjcxurlQxApYot
         G4Zw==
X-Forwarded-Encrypted: i=1; AKwUvByO7PYw6LceCCPjr88Vud9BJKvaXpoI7GSFvM+4F+u7oEga2wiUI6rI04iAHQlwf/BdIIV+YP8HiEjM3FEv@vger.kernel.org
X-Gm-Message-State: AFq9FYJr478i3Se8W9MW6row/AiOonCYchKlsGEcIKH3jq4X+fmd2Zmk
	oTPCZRDRyCoeBFHb2kF4Tn/45DLQBc/hphJAxpFJ433O6qO8inNRcXr31/9nrI6Evt86TlUm4r8
	FyaCtBuKj7Kimg76UoIjwLXarJeuSNYIG9yAc9cWFlTKoy6oYXs2vpr9sn/dAZs9MwR5J
X-Gm-Gg: AYBFou2ChomFKH4G7c0VjjYSOZ9cho2BpO7z/qgC6NZfhI7y915Gofz6Kl62vHmxXBJ
	pDEAXPZ/s2NjnMI5vKyhgxRFKYJumK7SKdZ/yyodcwoZO4dbJuYtmZAW5O6cygHkdBBpXdLQY14
	31eFOd7SBqSDtXwKEsmE2fv4yJW5NxynjzZeGKlLi/R6ZyEqGwneORyqiaA2YTCNL6PTWY6Dhjy
	ab7d4PB3ITgzXU+lTjWtmQFpycdROEz0hVL3/srkV4QbPh8Rqrwjtw95RKypwbOsPjaH4K55yph
	I1QkJN/jKAMv5r9t/m93QpprVTK/ERvTQh54sxUjBdv4w9CUGuIVpDwGTeAnKznCR6XLYhVZOJD
	HQqys2aXJNAUL7RqakMKDFw==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr518056485a.6.1792591229757;
        Wed, 21 Oct 2026 07:00:29 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr518034985a.6.1792591228650;
        Wed, 21 Oct 2026 07:00:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcc5sm7861166b.26.2026.10.21.07.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:00:27 -0700 (PDT)
Message-ID: <33d4d460-684b-4031-be45-3768e8d6c092@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:00:23 +0200
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
Subject: Re: [PATCH v21 12/14] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-12-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-12-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX7zwADsDEwHus
 ukW8yrsN8EZx6xTlQw5NYjRrFmEPuNx2h0QMYSukPIqmaDSm6igXSdqogYGWHmkBXrj5X0nrWx9
 GKaQKpogl59pfNp9mJvMIqSj/tP1YvY=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8c57e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RPG6soaBvYURGeOPBHsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YQOqhYRtfkP1nn_KtWDyv6oK2VA-Y88p
X-Proofpoint-ORIG-GUID: YQOqhYRtfkP1nn_KtWDyv6oK2VA-Y88p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX04P/YqXyYfkI
 J05DoyRY5s8f/emv87lgLLHBKBRMWnZk0oajJk/3XPkTFqsBP6sD2pPvrfnciP9jWnwCQQy21fX
 AwHGRb9YdWaUgedbsot87QmKHExIG8cAPCXwPAEfaudEyt+d+ex9+xFJ4s1yKlaOuBtoAMCwP4p
 OOEpekZOQ7PTocWBgs7m3qg4ETdGWajOqP3I8vyFlnyNtWQl/ofQzq1CFibFbp+FHEOABK9/FCQ
 IFTf15DmqpUAWtShHsem/rIamEE8a4FzZy5K+pcku6pFP04qajMkH3bJbJ+AIx7wLIX6GGMYfID
 8NwkC9WLDjVKVyKST3W3unVYOxvRDZzDk7pNn8+nMadWOFVID0RjxdAJfP1lA8noHeMayEeOtQW
 c2TBrFW7hgVNx6MviISL0XegD1swthu7tDMDlP8aScy1qeB4Hq5emXz1aEPwrweZZxQuNeT9V9m
 Xy9khfoD97UjgX/bh3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

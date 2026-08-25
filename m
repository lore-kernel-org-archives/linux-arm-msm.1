Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1A13D6463
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644919; cv=none; b=U61GWaOTfKzs0ulKSRK2N9AelL1NibCc+DxERaS8/X74yPWM257AQIXySwL3Q1SoCaEcuwporsX6v8T44wCJg3BWEzQUYYiqNjBzpdzbW1cCyRe60vSdOSSxCwmCJs5y59s0dXW4Y52PMnGWYEW6whNiAECjeKE+2x+WqoAgqA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644919; c=relaxed/simple;
	bh=od2LnbDdC6P6WWbmzkJe9cSTyda3C77kTQfvBWYLh7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lL7F2c94kgyuppklSL4OuUTtwJR+ClwOrDs1LHZJHCiv4g4aXVmDGrCCZqjvPyTHcnYJbU9umvo9AeGKADAeeg0lqJualXP3Vm4cNVEzzSiTEYNKfZg4GTkQ/vuzR6lHp9WglVbGuVIOPDi1kidVOKX5HCa+yUN8aTRH/cag5F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOVFcQr0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+JTsQGs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOVFcQr0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+JTsQGs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R2xn606822
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/6HIy7kUH+TmKoAiCbJ0Yyg2
	JhsNJM+N6xF9dVvLv3o=; b=MOVFcQr0cdSdiJzfNhkwhnf8EQ6ZiwJv2nX1xgz+
	l0njcgt80kX7nosganm0WFlUkT9T93LWW0BrqI2jx0XuISHIyvNxnK+fIXGmqwQd
	ZIM6cPBw9tW51mmbXCLJJines6DbM8GC6zxnMcUT82tOnk75zFZPFqIu9XQ9lk5y
	Mba4wb5Wwu3i/xPXsbwxW/zXP4wOyS4SMxXaUc/PFDayGw7Z8Snzdv+vxZXKQOHl
	LgyGbXK/fYIs5o4EWTLmRD4HE7j7U21lEfv4OWeEWhjOpb9VB7FDGr2Mt0z1jlw2
	BAeqh0s+cMa5U3qbKpOUcOa8FavnkGE1Qd2GpjiXcSM2UQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swy2vph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:01:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52de40127adso48855641cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787644914; x=1788249714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6HIy7kUH+TmKoAiCbJ0Yyg2JhsNJM+N6xF9dVvLv3o=;
        b=g+JTsQGsFIp8w1WAUQqCKLDAkN+QeMEH9DJn+6RTyPTZ6B5PmdjjPYwvdxyRQS9Vj6
         ScQy0rF9cb+2xPVOpb1EUUw7zuJXwKGMH0QT4AuqDScF5si+gXBchtHx5DKCWWX59UHA
         833mqJE5oiK21s+gSkpE2506QT5lBSj/UcAYJ6LuSlBLgsfMVz11SuF/w7O8AFHRv6g5
         JewhFNxs29ApqHfFvYqOK4cIf3ifFRZetT2W5Qwtl93LdZJ3ffVq8gIKUy3AmZabBoJp
         2pYCF/bPnzsB0nPk3sF+rd/EYzRRGzS96VIS3IQmD16p8TUZjmIkSgmXUNMzprhLcZiu
         q27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644914; x=1788249714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6HIy7kUH+TmKoAiCbJ0Yyg2JhsNJM+N6xF9dVvLv3o=;
        b=F44kwreh+5OkBJM3Xw2SNrVnF8lURBoVSAZlEtx7H2FMlgsc0h46q0lsgVMx/G6kbL
         n84k4zS3xN4JT7SVF7XW30CGqGPv+29U0KLYDWR8nw92BW6E/6g3+7fcsbLB+WrqUZMc
         Ay8LO+yIvm8tj3Fy7vnIhekRZz4D8fngW8+tKZK3/K4c2ke3UBHaA6nlNupdDioCLijA
         agbrZtn0sgIHGm5/ywt8F0yGsi0BF2+2CblaGQsTFUQ8aOlmIwXcRFYz0LNSZkYRqIIX
         fAllGjVA1V82MOpT7ujhJsrtgpY/PWGWdXX/AjpqUAjElCnsY7CnKMS73o8X4BSGhy3E
         IOPA==
X-Forwarded-Encrypted: i=1; AHgh+RrgVVM4CQYmtJHubyheGpS4yFmM624KkBhXd80/G+RERn0Ls78xseMtHTL/SqzTKCjn2fxYlNhy9gfAVd6Z@vger.kernel.org
X-Gm-Message-State: AFuF++kSB1TasNJgHESgH+CGk7MJQEY9Z3PlcH1eArvsq4zb0QNv6fnR
	DkzpSLNEspcmsxvif5YPlsejoG0/Xh9xwPhu2tfSD21pnmjFl+GKl8uwHKUZtoD8ylTX8p+l8T1
	zSjLd3nDfhJVsQ/UaVymo3RRUa0xwBPGfX3F7C1PcJKmky+3wX0XtnCqN8tYB2qJteWSL
X-Gm-Gg: AR+sD121DntTB9ICHbjP8M93m+u+h9zmZ8CW/yHloMj3hsv7Ej2FeQvAVr1afsmF1ED
	p2wBE6ObLGdRfL+35KJJgQKKuWf4n6goa6Ac2sQ0ZBlpoP1gMsM3QBClvZleSCHLIm2V2NiUIDI
	yvQgME2wzVeS9qIxQBgPEElsTCrNTYQKCzocu1ulQ9H+tJskFA5ZQyYBMT0P3/8HWok5x0U2asG
	1/0C0JlQ5Bno3x8knlNQCWtf6sHS5T2KmibZT4pYqE8okgkN3sAJWMRpUmuCPhrN7SWibNXoRct
	fQxkuVm/bAQ/HknFwNV2ZP3VD6Yt3bJgWfPWuwo6m1ItwCDwJ1sOlEAv4o3fAxGe777IF5ki9dY
	8gg+ITfwW2cgFBg==
X-Received: by 2002:a05:622a:2587:b0:528:17d9:2d99 with SMTP id d75a77b69052e-52e09d05552mr253697931cf.43.1787644914180;
        Tue, 25 Aug 2026 01:01:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2587:b0:528:17d9:2d99 with SMTP id d75a77b69052e-52e09d05552mr253696911cf.43.1787644913487;
        Tue, 25 Aug 2026 01:01:53 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8fasm1808170466b.8.2026.08.25.01.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:01:52 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:01:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/47] dt-bindings: clock: qcom: gcc-sdm845: Add CX
 power domain
Message-ID: <ovlrngkv4yxzwgxdkvuvi6trj742yl3aht6ezns7ryafdi65sq@pvnlmfojiq66>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-1-f1205a92682b@oss.qualcomm.com>
 <6d8b7fc0-9bd5-4bfa-97b0-a20bf01779c5@kernel.org>
 <qcvnb5nifvwtocgrlc5nddkwgakqjdrqj7uazplj5jpy7jmasu@o555nrglms2j>
 <14805eb9-964a-48e5-b6fa-b2616b52bc0c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14805eb9-964a-48e5-b6fa-b2616b52bc0c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX4ac0DHEAOwQx
 8dk91SXXByi691uItwWnboJJlSqiEGoreO+H0m5n3vmKlnbrpB3KxzGOEfI+av/Lr6T8Oqbu54u
 ypjxtKzlyrixxsI+mcxkhOLf6DEXimjhcxnVg89PEksD4LkIggwtFm7wSBU54quB9HT8drguhcP
 sWSzUxw3jhPK+MQxqBLPfU/q61x8BENAl7pm+iKHGJYlgRodzMP69w83jxMs9EmXFfUraCnuZ1Y
 RMK8wzTdDq1T1OQLlo8l/tYwdNOMycL6Jg+Ezw4bo7wREtiJhczdbJm28qLbe7p3rX5s5QwtwgP
 OQFglKqTphmnbGXfzpG0DPa6LRkRcUWKCDQX4SYaPTc9V/8RwTn6CuMTg/3N+l1L9GHgGB1KJ8H
 HbNkf8BM383uLIOJ9WbcxqKpyWnIj0pAt71MlMS3Z0bSlWnY+++sxyGcN9z5AxBl5ZmT4cS/UVF
 v/0ayvtc1yJ3SwQkfXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX+oTP5LU2vKEF
 GkhFxk36XDYOR0uL6QHgLLNxiWa3WE5QUDT0ce9dVpxRC3/FZdlmq+9vN43Vmm1+HKzsxddfSTF
 sC+uhREs4MgxHIQk6RBwK6LVE65VIyU=
X-Proofpoint-ORIG-GUID: GoQ9f82o4uvoNqM1Q-OBBxV1DFswNv_k
X-Proofpoint-GUID: GoQ9f82o4uvoNqM1Q-OBBxV1DFswNv_k
X-Authority-Analysis: v=2.4 cv=QIlYgALL c=1 sm=1 tr=0 ts=6a8d4bf3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JhlsCLWKGE4bq5yx_dUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250067

On 26-08-25 09:34:47, Krzysztof Kozlowski wrote:
> On 25/08/2026 09:30, Abel Vesa wrote:
> >>>  
> >>>  required:
> >>> @@ -56,6 +58,8 @@ allOf:
> >>>              - const: bi_tcxo
> >>>              - const: bi_tcxo_ao
> >>>              - const: sleep_clk
> >>> +      required:
> >>> +        - power-domains
> >>
> >> Why? Commit msg should tell me why you are changing ABI. It is actual
> >> ABI break without an explanation...
> > 
> > Actually, I should've kept the same commit message as for the other
> > bindings.
> > 
> > Thanks for reviewing.
> 
> The others only mention "to match hardware description" but that is poor
> reason for ABI break. If everything was working fine, thus domain is not
> really required, why would "matching the hardware description" matter?

An off-list discussion a while ago has concluded that GCC without CX as
PD could undervolt in some scenarios, as RPMh not adjusting
properly, due to consumers not voting on CX as they should.

Will add an explanation along those lines.

Thanks.
